use crate::image_processing::apply_orientation;
use anyhow::Result;
use image::{DynamicImage, ImageBuffer, Rgba};
use rawler::{
    decoders::{Orientation, RawDecodeParams, RawMetadata},
    imgop::develop::{DemosaicAlgorithm, Intermediate, ProcessingStep, RawDevelop},
    rawimage::RawImage,
    rawsource::RawSource,
};
use std::collections::HashMap;

/// Convert rawler's RawMetadata to a HashMap for the frontend
fn metadata_to_hashmap(metadata: &RawMetadata) -> HashMap<String, String> {
    let mut map = HashMap::new();
    let exif = &metadata.exif;

    // Camera info from RawMetadata
    if !metadata.make.is_empty() {
        map.insert("Make".to_string(), metadata.make.clone());
    }
    if !metadata.model.is_empty() {
        map.insert("Model".to_string(), metadata.model.clone());
    }

    // Lens info - from metadata.lens (if available) or from exif
    if let Some(ref lens) = metadata.lens {
        if !lens.lens_make.is_empty() {
            map.insert("LensMake".to_string(), lens.lens_make.clone());
        }
        if !lens.lens_model.is_empty() {
            map.insert("LensModel".to_string(), lens.lens_model.clone());
        }
    }
    // Override with EXIF lens info if available
    if let Some(ref lens_make) = exif.lens_make {
        map.insert("LensMake".to_string(), lens_make.clone());
    }
    if let Some(ref lens_model) = exif.lens_model {
        map.insert("LensModel".to_string(), lens_model.clone());
    }

    // Exposure settings
    if let Some(ref exp) = exif.exposure_time {
        if exp.d != 0 {
            if exp.n < exp.d {
                map.insert("ExposureTime".to_string(), format!("{}/{} s", exp.n, exp.d));
            } else {
                map.insert("ExposureTime".to_string(), format!("{} s", exp.n as f64 / exp.d as f64));
            }
        }
    }
    if let Some(ref fnum) = exif.fnumber {
        if fnum.d != 0 {
            map.insert("FNumber".to_string(), format!("f/{:.1}", fnum.n as f64 / fnum.d as f64));
        }
    }
    if let Some(iso) = exif.iso_speed_ratings {
        map.insert("ISOSpeedRatings".to_string(), iso.to_string());
    } else if let Some(iso) = exif.iso_speed {
        map.insert("ISOSpeedRatings".to_string(), iso.to_string());
    }
    if let Some(ref focal) = exif.focal_length {
        if focal.d != 0 {
            map.insert("FocalLength".to_string(), format!("{:.1} mm", focal.n as f64 / focal.d as f64));
        }
    }

    // Date/time
    if let Some(ref dt) = exif.date_time_original {
        map.insert("DateTimeOriginal".to_string(), dt.clone());
    }
    if let Some(ref dt) = exif.create_date {
        map.insert("CreateDate".to_string(), dt.clone());
    }
    if let Some(ref dt) = exif.modify_date {
        map.insert("ModifyDate".to_string(), dt.clone());
    }

    // Other useful info
    if let Some(ref artist) = exif.artist {
        map.insert("Artist".to_string(), artist.clone());
    }
    if let Some(ref copyright) = exif.copyright {
        map.insert("Copyright".to_string(), copyright.clone());
    }
    if let Some(ref serial) = exif.serial_number {
        map.insert("SerialNumber".to_string(), serial.clone());
    }
    if let Some(ref owner) = exif.owner_name {
        map.insert("OwnerName".to_string(), owner.clone());
    }

    // Exposure program and metering
    if let Some(prog) = exif.exposure_program {
        let prog_str = match prog {
            0 => "Not defined",
            1 => "Manual",
            2 => "Normal program",
            3 => "Aperture priority",
            4 => "Shutter priority",
            5 => "Creative program",
            6 => "Action program",
            7 => "Portrait mode",
            8 => "Landscape mode",
            _ => "Unknown",
        };
        map.insert("ExposureProgram".to_string(), prog_str.to_string());
    }
    if let Some(meter) = exif.metering_mode {
        let meter_str = match meter {
            0 => "Unknown",
            1 => "Average",
            2 => "Center-weighted average",
            3 => "Spot",
            4 => "Multi-spot",
            5 => "Pattern",
            6 => "Partial",
            255 => "Other",
            _ => "Unknown",
        };
        map.insert("MeteringMode".to_string(), meter_str.to_string());
    }

    // White balance
    if let Some(wb) = exif.white_balance {
        map.insert("WhiteBalance".to_string(), if wb == 0 { "Auto".to_string() } else { "Manual".to_string() });
    }

    // Flash
    if let Some(flash) = exif.flash {
        let fired = (flash & 1) == 1;
        map.insert("Flash".to_string(), if fired { "Fired".to_string() } else { "Did not fire".to_string() });
    }

    // GPS data
    if let Some(ref gps) = exif.gps {
        if let (Some(lat), Some(lat_ref)) = (&gps.gps_latitude, &gps.gps_latitude_ref) {
            let lat_deg = lat[0].n as f64 / lat[0].d.max(1) as f64
                + lat[1].n as f64 / lat[1].d.max(1) as f64 / 60.0
                + lat[2].n as f64 / lat[2].d.max(1) as f64 / 3600.0;
            map.insert("GPSLatitude".to_string(), format!("{:.6}° {}", lat_deg, lat_ref));
        }
        if let (Some(lon), Some(lon_ref)) = (&gps.gps_longitude, &gps.gps_longitude_ref) {
            let lon_deg = lon[0].n as f64 / lon[0].d.max(1) as f64
                + lon[1].n as f64 / lon[1].d.max(1) as f64 / 60.0
                + lon[2].n as f64 / lon[2].d.max(1) as f64 / 3600.0;
            map.insert("GPSLongitude".to_string(), format!("{:.6}° {}", lon_deg, lon_ref));
        }
        if let Some(alt) = &gps.gps_altitude {
            if alt.d != 0 {
                map.insert("GPSAltitude".to_string(), format!("{:.1} m", alt.n as f64 / alt.d as f64));
            }
        }
    }

    map
}

pub fn develop_raw_image(
    file_bytes: &[u8],
    fast_demosaic: bool,
    highlight_compression: f32,
) -> Result<DynamicImage> {
    let (developed_image, _orientation, _exif) =
        develop_internal(file_bytes, fast_demosaic, highlight_compression)?;
    Ok(developed_image)
}

/// Develop a RAW image and return both the image and EXIF metadata
pub fn develop_raw_image_with_exif(
    file_bytes: &[u8],
    fast_demosaic: bool,
    highlight_compression: f32,
) -> Result<(DynamicImage, HashMap<String, String>)> {
    let (developed_image, _orientation, exif) =
        develop_internal(file_bytes, fast_demosaic, highlight_compression)?;
    Ok((developed_image, exif))
}

fn develop_internal(
    file_bytes: &[u8],
    fast_demosaic: bool,
    highlight_compression: f32,
) -> Result<(DynamicImage, Orientation, HashMap<String, String>)> {
    let source = RawSource::new_from_slice(file_bytes);
    let decoder = rawler::get_decoder(&source)?;
    let mut raw_image: RawImage = decoder.raw_image(&source, &RawDecodeParams::default(), false)?;

    let metadata = decoder.raw_metadata(&source, &RawDecodeParams::default())?;
    let orientation = metadata
        .exif
        .orientation
        .map(Orientation::from_u16)
        .unwrap_or(Orientation::Normal);
    let exif_map = metadata_to_hashmap(&metadata);

    let original_white_level = raw_image
        .whitelevel
        .0
        .get(0)
        .cloned()
        .unwrap_or(u16::MAX as u32) as f32;
    let original_black_level = raw_image
        .blacklevel
        .levels
        .get(0)
        .map(|r| r.as_f32())
        .unwrap_or(0.0);

    let headroom_white_level = u32::MAX as f32;
    for level in raw_image.whitelevel.0.iter_mut() {
        *level = u32::MAX;
    }

    let mut developer = RawDevelop::default();
    if fast_demosaic {
        developer.demosaic_algorithm = DemosaicAlgorithm::Speed;
    }
    developer.steps.retain(|&step| step != ProcessingStep::SRgb);

    let mut developed_intermediate = developer.develop_intermediate(&raw_image)?;

    let denominator = (original_white_level - original_black_level).max(1.0);
    let rescale_factor = (headroom_white_level - original_black_level) / denominator;

    let safe_highlight_compression = highlight_compression.max(1.01);

    match &mut developed_intermediate {
        Intermediate::Monochrome(pixels) => {
            pixels.data.iter_mut().for_each(|p| {
                let linear_val = *p * rescale_factor;
                *p = linear_val;
            });
        }
        Intermediate::ThreeColor(pixels) => {
            pixels.data.iter_mut().for_each(|p| {
                let r = (p[0] * rescale_factor).max(0.0);
                let g = (p[1] * rescale_factor).max(0.0);
                let b = (p[2] * rescale_factor).max(0.0);

                let max_c = r.max(g).max(b);

                let (final_r, final_g, final_b) = if max_c > 1.0 {
                    let min_c = r.min(g).min(b);
                    let compression_factor = (1.0
                        - (max_c - 1.0) / (safe_highlight_compression - 1.0))
                        .max(0.0)
                        .min(1.0);
                    let compressed_r = min_c + (r - min_c) * compression_factor;
                    let compressed_g = min_c + (g - min_c) * compression_factor;
                    let compressed_b = min_c + (b - min_c) * compression_factor;
                    let compressed_max = compressed_r.max(compressed_g).max(compressed_b);

                    if compressed_max > 1e-6 {
                        let rescale = max_c / compressed_max;
                        (
                            compressed_r * rescale,
                            compressed_g * rescale,
                            compressed_b * rescale,
                        )
                    } else {
                        (max_c, max_c, max_c)
                    }
                } else {
                    (r, g, b)
                };

                p[0] = final_r;
                p[1] = final_g;
                p[2] = final_b;
            });
        }
        Intermediate::FourColor(pixels) => {
            pixels.data.iter_mut().for_each(|p| {
                p.iter_mut().for_each(|c| {
                    let linear_val = *c * rescale_factor;
                    *c = linear_val;
                });
            });
        }
    }

    let (width, height) = {
        let dim = developed_intermediate.dim();
        (dim.w as u32, dim.h as u32)
    };
    let dynamic_image = match developed_intermediate {
        Intermediate::ThreeColor(pixels) => {
            let buffer = ImageBuffer::<Rgba<f32>, _>::from_fn(width, height, |x, y| {
                let p = pixels.data[(y * width + x) as usize];
                Rgba([p[0], p[1], p[2], 1.0])
            });
            DynamicImage::ImageRgba32F(buffer)
        }
        Intermediate::Monochrome(pixels) => {
            let buffer = ImageBuffer::<Rgba<f32>, _>::from_fn(width, height, |x, y| {
                let p = pixels.data[(y * width + x) as usize];
                Rgba([p, p, p, 1.0])
            });
            DynamicImage::ImageRgba32F(buffer)
        }
        _ => {
            return Err(anyhow::anyhow!(
                "Unsupported intermediate format for f32 conversion"
            ));
        }
    };

    // Apply orientation to the image
    let oriented_image = apply_orientation(dynamic_image, orientation);

    Ok((oriented_image, orientation, exif_map))
}