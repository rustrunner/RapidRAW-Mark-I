struct Point {
    x: f32,
    y: f32,
    _pad1: f32,
    _pad2: f32,
}

struct HslColor {
    hue: f32,
    saturation: f32,
    luminance: f32,
    _pad: f32,
}

struct ColorGradeSettings {
    hue: f32,
    saturation: f32,
    luminance: f32,
    _pad: f32,
}

struct ColorCalibrationSettings {
    shadows_tint: f32,
    red_hue: f32,
    red_saturation: f32,
    green_hue: f32,
    green_saturation: f32,
    blue_hue: f32,
    blue_saturation: f32,
    _pad1: f32,
}

struct GlobalAdjustments {
    exposure: f32,
    brightness: f32,
    contrast: f32,
    highlights: f32,
    shadows: f32,
    whites: f32,
    blacks: f32,
    saturation: f32,
    temperature: f32,
    tint: f32,
    vibrance: f32,
    
    sharpness: f32,
    luma_noise_reduction: f32,
    color_noise_reduction: f32,
    clarity: f32,
    dehaze: f32,
    structure: f32,
    centre: f32,
    vignette_amount: f32,
    vignette_midpoint: f32,
    vignette_roundness: f32,
    vignette_feather: f32,
    grain_amount: f32,
    grain_size: f32,
    grain_roughness: f32,

    chromatic_aberration_red_cyan: f32,
    chromatic_aberration_blue_yellow: f32,
    show_clipping: u32,
    is_raw_image: u32,

    enable_negative_conversion: u32,
    film_base_r: f32,
    film_base_g: f32,
    film_base_b: f32,
    negative_red_balance: f32,
    negative_green_balance: f32,
    negative_blue_balance: f32,
    _pad_neg1: f32,
    _pad_neg2: f32,

    has_lut: u32,
    lut_intensity: f32,
    tonemapper_mode: u32,
    _pad_lut2: f32,
    _pad_lut3: f32,
    _pad_lut4: f32,
    _pad_lut5: f32,

    _pad_agx1: f32,
    _pad_agx2: f32,
    _pad_agx3: f32,
    agx_pipe_to_rendering_matrix: mat3x3<f32>,
    agx_rendering_to_pipe_matrix: mat3x3<f32>,

    _pad_cg1: f32,
    _pad_cg2: f32,
    _pad_cg3: f32,
    _pad_cg4: f32,
    color_grading_shadows: ColorGradeSettings,
    color_grading_midtones: ColorGradeSettings,
    color_grading_highlights: ColorGradeSettings,
    color_grading_blending: f32,
    color_grading_balance: f32,
    _pad2: f32,
    _pad3: f32,

    color_calibration: ColorCalibrationSettings,

    // Low-Light Recovery: Hot Pixels
    hot_pixel_enabled: u32,
    hot_pixel_threshold: f32,
    hot_pixel_radius: f32,
    hot_pixel_mode: u32,  // 0=median, 1=interpolate, 2=clone

    // Denoiser (ISO-adaptive)
    denoise_enabled: u32,
    denoise_strength: f32,
    denoise_detail: f32,
    denoise_chroma: f32,
    denoise_iso_multiplier: f32,
    _pad_denoise1: f32,
    _pad_denoise2: f32,
    _pad_denoise3: f32,

    // PID Enhancement: Smart Deblur
    deblur_enabled: u32,
    deblur_type: u32,  // 0=motion, 1=focus, 2=gaussian
    deblur_length: f32,
    deblur_angle: f32,
    deblur_radius: f32,
    deblur_strength: f32,
    deblur_smoothness: f32,
    deblur_noise_damp: f32,
    deblur_preview_size: f32,
    deblur_show_kernel: u32,
    deblur_iterations: u32,
    _pad_deblur2: f32,

    hsl: array<HslColor, 8>,
    luma_curve: array<Point, 16>,
    red_curve: array<Point, 16>,
    green_curve: array<Point, 16>,
    blue_curve: array<Point, 16>,
    luma_curve_count: u32,
    red_curve_count: u32,
    green_curve_count: u32,
    blue_curve_count: u32,
    _pad_end1: f32,
    _pad_end2: f32,
    _pad_end3: f32,
    _pad_end4: f32,
}

struct MaskAdjustments {
    exposure: f32,
    brightness: f32,
    contrast: f32,
    highlights: f32,
    shadows: f32,
    whites: f32,
    blacks: f32,
    saturation: f32,
    temperature: f32,
    tint: f32,
    vibrance: f32,
    
    sharpness: f32,
    luma_noise_reduction: f32,
    color_noise_reduction: f32,
    clarity: f32,
    dehaze: f32,
    structure: f32,
    
    _pad1: f32,
    _pad2: f32,
    _pad3: f32,
    _pad4: f32,

    _pad_cg1: f32,
    _pad_cg2: f32,
    _pad_cg3: f32,
    color_grading_shadows: ColorGradeSettings,
    color_grading_midtones: ColorGradeSettings,
    color_grading_highlights: ColorGradeSettings,
    color_grading_blending: f32,
    color_grading_balance: f32,
    _pad5: f32,
    _pad6: f32,

    // PID Enhancement (mask-supported)
    deblur_strength: f32,
    deblur_smoothness: f32,
    _pad_pid1: f32,
    _pad_pid2: f32,

    hsl: array<HslColor, 8>,
    luma_curve: array<Point, 16>,
    red_curve: array<Point, 16>,
    green_curve: array<Point, 16>,
    blue_curve: array<Point, 16>,
    luma_curve_count: u32,
    red_curve_count: u32,
    green_curve_count: u32,
    blue_curve_count: u32,
    _pad_end4: f32,
    _pad_end5: f32,
    _pad_end6: f32,
    _pad_end7: f32,
}

struct AllAdjustments {
    global: GlobalAdjustments,
    mask_adjustments: array<MaskAdjustments, 11>,
    mask_count: u32,
    tile_offset_x: u32,
    tile_offset_y: u32,
    mask_atlas_cols: u32,
}

struct HslRange {
    center: f32,
    width: f32,
}

const HSL_RANGES: array<HslRange, 8> = array<HslRange, 8>(
    HslRange(358.0, 35.0),  // Red
    HslRange(25.0, 45.0),   // Orange
    HslRange(60.0, 40.0),   // Yellow
    HslRange(115.0, 90.0),  // Green
    HslRange(180.0, 60.0),  // Aqua
    HslRange(225.0, 60.0),  // Blue
    HslRange(280.0, 55.0),  // Purple
    HslRange(330.0, 50.0)   // Magenta
);

@group(0) @binding(0) var input_texture: texture_2d<f32>;
@group(0) @binding(1) var output_texture: texture_storage_2d<rgba8unorm, write>;
@group(0) @binding(2) var<uniform> adjustments: AllAdjustments;

@group(0) @binding(3) var mask0: texture_2d<f32>;
@group(0) @binding(4) var mask1: texture_2d<f32>;
@group(0) @binding(5) var mask2: texture_2d<f32>;
@group(0) @binding(6) var mask3: texture_2d<f32>;
@group(0) @binding(7) var mask4: texture_2d<f32>;
@group(0) @binding(8) var mask5: texture_2d<f32>;
@group(0) @binding(9) var mask6: texture_2d<f32>;
@group(0) @binding(10) var mask7: texture_2d<f32>;
@group(0) @binding(11) var mask8: texture_2d<f32>;
@group(0) @binding(12) var mask9: texture_2d<f32>;
@group(0) @binding(13) var mask10: texture_2d<f32>;

@group(0) @binding(14) var lut_texture: texture_3d<f32>;
@group(0) @binding(15) var lut_sampler: sampler;

@group(0) @binding(16) var sharpness_blur_texture: texture_2d<f32>;
@group(0) @binding(17) var clarity_blur_texture: texture_2d<f32>;
@group(0) @binding(18) var structure_blur_texture: texture_2d<f32>;

const LUMA_COEFF = vec3<f32>(0.2126, 0.7152, 0.0722);

fn get_luma(c: vec3<f32>) -> f32 {
    return dot(c, LUMA_COEFF);
}

fn srgb_to_linear(c: vec3<f32>) -> vec3<f32> {
    let cutoff = vec3<f32>(0.04045);
    let a = vec3<f32>(0.055);
    let higher = pow((c + a) / (1.0 + a), vec3<f32>(2.4));
    let lower = c / 12.92;
    return select(higher, lower, c <= cutoff);
}

fn linear_to_srgb(c: vec3<f32>) -> vec3<f32> {
    let c_clamped = clamp(c, vec3<f32>(0.0), vec3<f32>(1.0));
    let cutoff = vec3<f32>(0.0031308);
    let a = vec3<f32>(0.055);
    let higher = (1.0 + a) * pow(c_clamped, vec3<f32>(1.0 / 2.4)) - a;
    let lower = c_clamped * 12.92;
    return select(higher, lower, c_clamped <= cutoff);
}

fn rgb_to_hsv(c: vec3<f32>) -> vec3<f32> {
    let c_max = max(c.r, max(c.g, c.b));
    let c_min = min(c.r, min(c.g, c.b));
    let delta = c_max - c_min;
    var h: f32 = 0.0;
    if (delta > 0.0) {
        if (c_max == c.r) { h = 60.0 * (((c.g - c.b) / delta) % 6.0); }
        else if (c_max == c.g) { h = 60.0 * (((c.b - c.r) / delta) + 2.0); }
        else { h = 60.0 * (((c.r - c.g) / delta) + 4.0); }
    }
    if (h < 0.0) { h += 360.0; }
    let s = select(0.0, delta / c_max, c_max > 0.0);
    return vec3<f32>(h, s, c_max);
}

fn hsv_to_rgb(c: vec3<f32>) -> vec3<f32> {
    let h = c.x; let s = c.y; let v = c.z;
    let C = v * s;
    let X = C * (1.0 - abs((h / 60.0) % 2.0 - 1.0));
    let m = v - C;
    var rgb_prime: vec3<f32>;
    if (h < 60.0) { rgb_prime = vec3<f32>(C, X, 0.0); }
    else if (h < 120.0) { rgb_prime = vec3<f32>(X, C, 0.0); }
    else if (h < 180.0) { rgb_prime = vec3<f32>(0.0, C, X); }
    else if (h < 240.0) { rgb_prime = vec3<f32>(0.0, X, C); }
    else if (h < 300.0) { rgb_prime = vec3<f32>(X, 0.0, C); }
    else { rgb_prime = vec3<f32>(C, 0.0, X); }
    return rgb_prime + vec3<f32>(m, m, m);
}

// ============================================================================
// HOT PIXEL DETECTION AND CORRECTION
// ============================================================================

fn sort3(a: f32, b: f32, c: f32) -> vec3<f32> {
    // Returns sorted values (min, mid, max)
    let min_val = min(a, min(b, c));
    let max_val = max(a, max(b, c));
    let mid_val = a + b + c - min_val - max_val;
    return vec3<f32>(min_val, mid_val, max_val);
}

fn median5(a: f32, b: f32, c: f32, d: f32, e: f32) -> f32 {
    // Find median of 5 values using sorting network
    var v = array<f32, 5>(a, b, c, d, e);
    // Sorting network for 5 elements
    if (v[0] > v[1]) { let t = v[0]; v[0] = v[1]; v[1] = t; }
    if (v[2] > v[3]) { let t = v[2]; v[2] = v[3]; v[3] = t; }
    if (v[0] > v[2]) { let t = v[0]; v[0] = v[2]; v[2] = t; }
    if (v[1] > v[3]) { let t = v[1]; v[1] = v[3]; v[3] = t; }
    if (v[1] > v[2]) { let t = v[1]; v[1] = v[2]; v[2] = t; }
    if (v[2] > v[4]) { let t = v[2]; v[2] = v[4]; v[4] = t; }
    if (v[1] > v[2]) { let t = v[1]; v[1] = v[2]; v[2] = t; }
    return v[2];
}

fn detect_hot_pixel_channel(center_val: f32, neighbors: array<f32, 8>, threshold: f32) -> bool {
    // Calculate median of neighbors
    // For 8 neighbors, use median of first 5 as approximation for speed
    let med = median5(neighbors[0], neighbors[1], neighbors[2], neighbors[3], neighbors[4]);

    // Check if center deviates significantly from median
    let deviation = abs(center_val - med) / max(med, 0.001);
    return deviation > threshold;
}

fn get_neighbor_values(coord: vec2<i32>, channel: i32) -> array<f32, 8> {
    var neighbors: array<f32, 8>;
    let offsets = array<vec2<i32>, 8>(
        vec2<i32>(-1, -1), vec2<i32>(0, -1), vec2<i32>(1, -1),
        vec2<i32>(-1, 0),                    vec2<i32>(1, 0),
        vec2<i32>(-1, 1),  vec2<i32>(0, 1),  vec2<i32>(1, 1)
    );

    for (var i = 0u; i < 8u; i++) {
        let sample_coord = coord + offsets[i];
        let pixel = textureLoad(input_texture, sample_coord, 0);
        neighbors[i] = pixel[channel];
    }
    return neighbors;
}

fn correct_hot_pixel_median(coord: vec2<i32>, channel: i32) -> f32 {
    let neighbors = get_neighbor_values(coord, channel);
    return median5(neighbors[0], neighbors[1], neighbors[2], neighbors[3], neighbors[4]);
}

fn correct_hot_pixel_interpolate(coord: vec2<i32>, channel: i32) -> f32 {
    // Bilinear interpolation from diagonal neighbors
    let tl = textureLoad(input_texture, coord + vec2<i32>(-1, -1), 0)[channel];
    let tr = textureLoad(input_texture, coord + vec2<i32>(1, -1), 0)[channel];
    let bl = textureLoad(input_texture, coord + vec2<i32>(-1, 1), 0)[channel];
    let br = textureLoad(input_texture, coord + vec2<i32>(1, 1), 0)[channel];
    return (tl + tr + bl + br) * 0.25;
}

fn correct_hot_pixel_clone(coord: vec2<i32>, channel: i32) -> f32 {
    // Clone from the neighbor with most similar overall brightness
    let center = textureLoad(input_texture, coord, 0).rgb;
    let center_luma = dot(center, LUMA_COEFF);

    let offsets = array<vec2<i32>, 4>(
        vec2<i32>(0, -1), vec2<i32>(-1, 0), vec2<i32>(1, 0), vec2<i32>(0, 1)
    );

    var best_val = textureLoad(input_texture, coord + offsets[0], 0)[channel];
    var best_diff = 1000.0;

    for (var i = 0u; i < 4u; i++) {
        let neighbor = textureLoad(input_texture, coord + offsets[i], 0).rgb;
        let neighbor_luma = dot(neighbor, LUMA_COEFF);
        let diff = abs(neighbor_luma - center_luma);
        if (diff < best_diff) {
            best_diff = diff;
            best_val = neighbor[channel];
        }
    }
    return best_val;
}

fn apply_hot_pixel_correction(coord: vec2<i32>, color: vec3<f32>, threshold: f32, radius: f32, mode: u32) -> vec3<f32> {
    var result = color;
    let radius_i = i32(radius);

    // Check each channel independently
    for (var ch = 0; ch < 3; ch++) {
        let neighbors = get_neighbor_values(coord, ch);
        if (detect_hot_pixel_channel(color[ch], neighbors, threshold)) {
            // Apply correction based on mode
            if (mode == 0u) {
                result[ch] = correct_hot_pixel_median(coord, ch);
            } else if (mode == 1u) {
                result[ch] = correct_hot_pixel_interpolate(coord, ch);
            } else {
                result[ch] = correct_hot_pixel_clone(coord, ch);
            }
        }
    }
    return result;
}

// ============================================================================
// OKLAB COLOR SPACE (for perceptually uniform color operations)
// ============================================================================

fn cbrt(x: f32) -> f32 {
    // Cube root approximation
    return sign(x) * pow(abs(x), 1.0 / 3.0);
}

fn linear_srgb_to_oklab(c: vec3<f32>) -> vec3<f32> {
    // Linear sRGB to Oklab conversion
    let l = 0.4122214708 * c.r + 0.5363325363 * c.g + 0.0514459929 * c.b;
    let m = 0.2119034982 * c.r + 0.6806995451 * c.g + 0.1073969566 * c.b;
    let s = 0.0883024619 * c.r + 0.2817188376 * c.g + 0.6299787005 * c.b;

    let l_ = cbrt(l);
    let m_ = cbrt(m);
    let s_ = cbrt(s);

    return vec3<f32>(
        0.2104542553 * l_ + 0.7936177850 * m_ - 0.0040720468 * s_,
        1.9779984951 * l_ - 2.4285922050 * m_ + 0.4505937099 * s_,
        0.0259040371 * l_ + 0.7827717662 * m_ - 0.8086757660 * s_
    );
}

fn oklab_to_linear_srgb(c: vec3<f32>) -> vec3<f32> {
    // Oklab to linear sRGB conversion
    let l_ = c.x + 0.3963377774 * c.y + 0.2158037573 * c.z;
    let m_ = c.x - 0.1055613458 * c.y - 0.0638541728 * c.z;
    let s_ = c.x - 0.0894841775 * c.y - 1.2914855480 * c.z;

    let l = l_ * l_ * l_;
    let m = m_ * m_ * m_;
    let s = s_ * s_ * s_;

    return vec3<f32>(
        4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s,
        -1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s,
        -0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s
    );
}

fn oklab_to_oklch(lab: vec3<f32>) -> vec3<f32> {
    // Convert Oklab to Oklch (L, C, h)
    let L = lab.x;
    let C = sqrt(lab.y * lab.y + lab.z * lab.z);
    var h = atan2(lab.z, lab.y) * 180.0 / 3.14159265359;
    if (h < 0.0) { h += 360.0; }
    return vec3<f32>(L, C, h);
}

fn oklch_to_oklab(lch: vec3<f32>) -> vec3<f32> {
    // Convert Oklch to Oklab
    let h_rad = lch.z * 3.14159265359 / 180.0;
    return vec3<f32>(
        lch.x,
        lch.y * cos(h_rad),
        lch.y * sin(h_rad)
    );
}

// ============================================================================
// COLOR FIXER (Perceptual Saturation with Protection)
// ============================================================================

fn is_skin_tone(hue: f32) -> f32 {
    // Skin tones are roughly in the range 15-50 degrees (warm colors)
    let skin_center = 30.0;
    let skin_width = 25.0;
    let dist = min(abs(hue - skin_center), 360.0 - abs(hue - skin_center));
    return smoothstep(skin_width, skin_width * 0.5, dist);
}

fn is_sky_tone(hue: f32) -> f32 {
    // Sky blues are roughly in the range 200-240 degrees
    let sky_center = 220.0;
    let sky_width = 30.0;
    let dist = min(abs(hue - sky_center), 360.0 - abs(hue - sky_center));
    return smoothstep(sky_width, sky_width * 0.5, dist);
}

fn apply_color_fixer(
    rgb: vec3<f32>,
    vibrance: f32,
    saturation_boost: f32,
    shadow_sat: f32,
    skin_protect: f32,
    sky_protect: f32,
    sat_cap: f32
) -> vec3<f32> {
    // Skip if no adjustments needed
    if (abs(vibrance) < 0.001 && abs(saturation_boost) < 0.001 && abs(shadow_sat) < 0.001) {
        return rgb;
    }

    // Convert to Oklab for perceptual processing
    let oklab = linear_srgb_to_oklab(rgb);
    var oklch = oklab_to_oklch(oklab);

    let L = oklch.x;
    let C = oklch.y;
    let h = oklch.z;

    // Current saturation level (chroma relative to lightness)
    let current_sat = C / max(L, 0.001);

    // Vibrance: boost low-saturation colors more than high-saturation
    // Formula: S' = S + vibrance * (1 - S) * S
    let vibrance_effect = vibrance * (1.0 - min(current_sat, 1.0));
    var chroma_mult = 1.0 + vibrance_effect;

    // Standard saturation boost
    chroma_mult *= (1.0 + saturation_boost);

    // Shadow saturation boost (based on luminance)
    let shadow_factor = 1.0 - smoothstep(0.0, 0.35, L);
    chroma_mult *= (1.0 + shadow_sat * shadow_factor);

    // Apply skin tone protection
    let skin_amount = is_skin_tone(h);
    let skin_reduction = mix(1.0, 0.3, skin_amount * skin_protect);
    chroma_mult = mix(chroma_mult, 1.0 + (chroma_mult - 1.0) * skin_reduction, skin_amount);

    // Apply sky tone protection
    let sky_amount = is_sky_tone(h);
    let sky_reduction = mix(1.0, 0.5, sky_amount * sky_protect);
    chroma_mult = mix(chroma_mult, 1.0 + (chroma_mult - 1.0) * sky_reduction, sky_amount);

    // Apply chroma multiplier
    var new_chroma = C * chroma_mult;

    // Saturation cap to prevent radioactive colors
    // Maximum chroma is approximately 0.4 * L for most colors to stay in gamut
    let max_chroma = sat_cap * L * 0.4;
    new_chroma = min(new_chroma, max_chroma);
    new_chroma = max(new_chroma, 0.0);

    // Convert back to RGB
    let new_oklch = vec3<f32>(L, new_chroma, h);
    let new_oklab = oklch_to_oklab(new_oklch);
    var new_rgb = oklab_to_linear_srgb(new_oklab);

    // Clamp to valid range
    new_rgb = clamp(new_rgb, vec3<f32>(0.0), vec3<f32>(1.0));

    return new_rgb;
}

// ============================================================================
// SHADOW LIFTER (Tone Equalizer with EV-based Luminance Masking)
// ============================================================================

fn luminance_to_ev(luma: f32) -> f32 {
    // Convert linear luminance to EV (exposure value)
    // EV = log2(luminance / 0.18) where 0.18 is middle gray
    // Clamp to avoid log2(0)
    let safe_luma = max(luma, 0.00001);
    return log2(safe_luma / 0.18);
}

fn ev_to_luminance(ev: f32) -> f32 {
    // Convert EV back to linear luminance
    return 0.18 * pow(2.0, ev);
}

fn shadow_mask_from_ev(ev: f32, shadow_range: f32, transition: f32) -> f32 {
    // Create a smooth mask that's 1.0 in deep shadows, 0.0 in highlights
    // shadow_range controls what EV counts as shadow (0-100 maps to -2 to -8 EV)
    // transition controls the smoothness of the falloff

    // Map shadow_range 0-100 to EV threshold (-2 to -8)
    let shadow_ev_threshold = mix(-2.0, -8.0, shadow_range / 100.0);

    // Transition width in EV stops (0.5 to 4 stops based on transition parameter)
    let transition_width = mix(0.5, 4.0, transition / 100.0);

    // Smooth falloff from shadow threshold
    return 1.0 - smoothstep(shadow_ev_threshold - transition_width, shadow_ev_threshold + transition_width, ev);
}

fn highlight_protection_mask(ev: f32, protection: f32) -> f32 {
    // Protect highlights from being affected by shadow lifting
    // Returns 0.0 for highlights that should be protected, 1.0 for shadows

    // Highlight threshold: around 0 EV (middle gray) to +2 EV
    let highlight_start = mix(2.0, -1.0, protection / 100.0);
    let highlight_end = highlight_start + 2.0;

    // Inverse mask: 1.0 in shadows, fades to 0.0 in highlights
    return 1.0 - smoothstep(highlight_start, highlight_end, ev);
}

fn apply_shadow_lifter(
    rgb: vec3<f32>,
    shadow_boost: f32,      // -4 to +6 EV
    shadow_range: f32,      // 0-100 (what counts as shadow)
    highlight_protect: f32, // 0-100
    shadow_transition: f32, // 0-100 (smoothness)
    black_point: f32,       // -12 to 0 EV
    pivot_point: f32,       // -8 to 0 EV
    compression: f32        // 0-100
) -> vec3<f32> {
    // Skip if no adjustment needed
    if (abs(shadow_boost) < 0.001) {
        return rgb;
    }

    // Get luminance and convert to EV
    let luma = get_luma(rgb);
    if (luma < 0.00001) {
        return rgb;  // Pure black, nothing to lift
    }

    let ev = luminance_to_ev(luma);

    // Calculate shadow mask (where to apply the lift)
    let shadow_mask = shadow_mask_from_ev(ev, shadow_range, shadow_transition);

    // Calculate highlight protection
    let highlight_mask = highlight_protection_mask(ev, highlight_protect);

    // Combined mask: only affect shadows, protect highlights
    let combined_mask = shadow_mask * highlight_mask;

    if (combined_mask < 0.001) {
        return rgb;  // No adjustment in this region
    }

    // Calculate the lift amount based on EV distance from pivot
    // Pixels further below pivot get more lift
    let ev_from_pivot = pivot_point - ev;
    let normalized_depth = clamp(ev_from_pivot / max(pivot_point - black_point, 0.1), 0.0, 1.0);

    // Apply compression to the depth curve (reduces lift in deepest shadows)
    let compressed_depth = pow(normalized_depth, 1.0 + compression / 100.0);

    // Calculate target EV
    // Full boost at the deepest shadows, tapering toward pivot
    let lift_amount = shadow_boost * compressed_depth * combined_mask;
    let target_ev = ev + lift_amount;

    // Convert target EV back to luminance
    let target_luma = ev_to_luminance(target_ev);

    // Scale RGB to match new luminance while preserving color ratios
    let scale = target_luma / luma;
    var result = rgb * scale;

    // Soft-clip to prevent excessive brightness while preserving color
    let max_component = max(result.r, max(result.g, result.b));
    if (max_component > 1.0) {
        // Desaturate toward white as we approach clipping
        let overflow = max_component - 1.0;
        let desaturation = min(overflow / max_component, 1.0);
        result = mix(result, vec3<f32>(target_luma), desaturation * 0.5);
        result = result / max_component;  // Normalize
    }

    return max(result, vec3<f32>(0.0));
}

// Mask-compatible version with fewer parameters
fn apply_shadow_lifter_mask(
    rgb: vec3<f32>,
    shadow_boost: f32,
    shadow_range: f32,
    highlight_protect: f32,
    shadow_transition: f32
) -> vec3<f32> {
    // Use default values for advanced parameters
    return apply_shadow_lifter(
        rgb,
        shadow_boost,
        shadow_range,
        highlight_protect,
        shadow_transition,
        -8.0,   // Default black point
        -4.0,   // Default pivot point
        0.0     // No compression
    );
}

// ============================================================================
// DENOISER (ISO-Adaptive Edge-Aware Bilateral Filter with Luma/Chroma Separation)
// ============================================================================

// Convert linear RGB to YCbCr-like space for separate luma/chroma processing
fn rgb_to_ycbcr(rgb: vec3<f32>) -> vec3<f32> {
    let y = dot(rgb, LUMA_COEFF);
    let cb = (rgb.b - y) * 0.565;
    let cr = (rgb.r - y) * 0.713;
    return vec3<f32>(y, cb, cr);
}

fn ycbcr_to_rgb(ycbcr: vec3<f32>) -> vec3<f32> {
    let y = ycbcr.x;
    let cb = ycbcr.y;
    let cr = ycbcr.z;
    let r = y + cr / 0.713;
    let b = y + cb / 0.565;
    let g = (y - LUMA_COEFF.r * r - LUMA_COEFF.b * b) / LUMA_COEFF.g;
    return vec3<f32>(r, g, b);
}

// Gaussian weight based on spatial distance
fn spatial_weight(dist_sq: f32, sigma: f32) -> f32 {
    return exp(-dist_sq / (2.0 * sigma * sigma));
}

// Range weight based on intensity difference (bilateral filter)
fn range_weight(diff: f32, sigma: f32) -> f32 {
    return exp(-(diff * diff) / (2.0 * sigma * sigma));
}

// Estimate local noise level based on local variance
fn estimate_local_noise(coord: vec2<i32>, center_luma: f32) -> f32 {
    var variance_sum: f32 = 0.0;
    var count: f32 = 0.0;

    // Sample a small neighborhood to estimate noise
    for (var dy = -1; dy <= 1; dy++) {
        for (var dx = -1; dx <= 1; dx++) {
            let sample_coord = coord + vec2<i32>(dx, dy);
            let sample = textureLoad(input_texture, sample_coord, 0).rgb;
            let sample_luma = get_luma(sample);
            let diff = sample_luma - center_luma;
            variance_sum += diff * diff;
            count += 1.0;
        }
    }

    return sqrt(variance_sum / count);
}

// Edge detection using Sobel operator
fn detect_edge_strength(coord: vec2<i32>) -> f32 {
    // Sobel kernels
    // Gx: -1 0 1    Gy:  1  2  1
    //     -2 0 2         0  0  0
    //     -1 0 1        -1 -2 -1

    var gx: f32 = 0.0;
    var gy: f32 = 0.0;

    let sobel_x = array<f32, 9>(-1.0, 0.0, 1.0, -2.0, 0.0, 2.0, -1.0, 0.0, 1.0);
    let sobel_y = array<f32, 9>(1.0, 2.0, 1.0, 0.0, 0.0, 0.0, -1.0, -2.0, -1.0);

    var idx = 0;
    for (var dy = -1; dy <= 1; dy++) {
        for (var dx = -1; dx <= 1; dx++) {
            let sample_coord = coord + vec2<i32>(dx, dy);
            let sample = textureLoad(input_texture, sample_coord, 0).rgb;
            let luma = get_luma(sample);
            gx += luma * sobel_x[idx];
            gy += luma * sobel_y[idx];
            idx++;
        }
    }

    return sqrt(gx * gx + gy * gy);
}

// Main bilateral filter for luma channel
fn bilateral_filter_luma(
    coord: vec2<i32>,
    center_luma: f32,
    spatial_sigma: f32,
    range_sigma: f32,
    radius: i32
) -> f32 {
    var weighted_sum: f32 = 0.0;
    var weight_sum: f32 = 0.0;

    for (var dy = -radius; dy <= radius; dy++) {
        for (var dx = -radius; dx <= radius; dx++) {
            let sample_coord = coord + vec2<i32>(dx, dy);
            let sample = textureLoad(input_texture, sample_coord, 0).rgb;
            let sample_luma = get_luma(sample);

            // Spatial weight (distance from center)
            let dist_sq = f32(dx * dx + dy * dy);
            let w_spatial = spatial_weight(dist_sq, spatial_sigma);

            // Range weight (intensity similarity)
            let diff = abs(sample_luma - center_luma);
            let w_range = range_weight(diff, range_sigma);

            let w = w_spatial * w_range;
            weighted_sum += sample_luma * w;
            weight_sum += w;
        }
    }

    return weighted_sum / max(weight_sum, 0.0001);
}

// Stronger smoothing for chroma channels (less perceptually important)
fn smooth_chroma(
    coord: vec2<i32>,
    center_ycbcr: vec3<f32>,
    spatial_sigma: f32,
    radius: i32
) -> vec2<f32> {
    var cb_sum: f32 = 0.0;
    var cr_sum: f32 = 0.0;
    var weight_sum: f32 = 0.0;

    for (var dy = -radius; dy <= radius; dy++) {
        for (var dx = -radius; dx <= radius; dx++) {
            let sample_coord = coord + vec2<i32>(dx, dy);
            let sample = textureLoad(input_texture, sample_coord, 0).rgb;
            let sample_ycbcr = rgb_to_ycbcr(sample);

            // Spatial weight only (stronger smoothing for chroma)
            let dist_sq = f32(dx * dx + dy * dy);
            let w = spatial_weight(dist_sq, spatial_sigma);

            cb_sum += sample_ycbcr.y * w;
            cr_sum += sample_ycbcr.z * w;
            weight_sum += w;
        }
    }

    return vec2<f32>(cb_sum, cr_sum) / max(weight_sum, 0.0001);
}

fn apply_denoise(
    coord: vec2<i32>,
    rgb: vec3<f32>,
    strength: f32,          // 0-100: base denoise strength
    detail: f32,            // 0-100: detail preservation (higher = more detail kept)
    chroma: f32,            // 0-100: chroma smoothing strength
    iso_multiplier: f32     // ISO-based multiplier (0.3-1.5, scales effective strength)
) -> vec3<f32> {
    // Apply ISO multiplier to get effective strength
    let effective_strength = min(strength * iso_multiplier, 100.0);
    let effective_chroma = min(chroma * iso_multiplier, 100.0);

    // Skip if no denoising needed
    if (effective_strength < 0.1 && effective_chroma < 0.1) {
        return rgb;
    }

    // Convert to YCbCr for separate processing
    let ycbcr = rgb_to_ycbcr(rgb);
    let center_luma = ycbcr.x;

    // Calculate adaptive radius based on ISO-scaled strength
    // Higher ISO = more noise = larger radius needed
    let radius = i32(mix(1.0, 4.0, effective_strength / 100.0));

    // Spatial sigma: larger = more blur
    let base_spatial_sigma = mix(0.5, 3.0, effective_strength / 100.0);

    // Range sigma: controls edge sensitivity
    // Higher detail = lower range sigma = more edge preservation
    let range_sigma = mix(0.02, 0.15, 1.0 - detail / 100.0);

    // Detect edges to preserve detail
    let edge_strength = detect_edge_strength(coord);
    let edge_preserve = smoothstep(0.05, 0.3, edge_strength);

    // Reduce denoising on edges based on detail preservation setting
    let edge_factor = mix(1.0, 1.0 - edge_preserve, detail / 100.0);

    // === LUMA DENOISING ===
    var new_luma = center_luma;
    let scaled_luma_strength = effective_strength * edge_factor;

    if (scaled_luma_strength > 0.1) {
        let luma_spatial_sigma = base_spatial_sigma * (scaled_luma_strength / 100.0);
        let filtered_luma = bilateral_filter_luma(
            coord,
            center_luma,
            luma_spatial_sigma,
            range_sigma,
            radius
        );

        // Blend based on strength
        let luma_blend = scaled_luma_strength / 100.0;
        new_luma = mix(center_luma, filtered_luma, luma_blend);
    }

    // === CHROMA DENOISING ===
    var new_cb = ycbcr.y;
    var new_cr = ycbcr.z;

    if (effective_chroma > 0.1) {
        // Chroma can be smoothed more aggressively
        let chroma_sigma = mix(1.0, 4.0, effective_chroma / 100.0);
        let chroma_radius = max(radius, 2);  // At least 2 for chroma

        let smoothed_chroma = smooth_chroma(
            coord,
            ycbcr,
            chroma_sigma,
            chroma_radius
        );

        // Blend based on chroma strength
        let chroma_blend = effective_chroma / 100.0;
        new_cb = mix(ycbcr.y, smoothed_chroma.x, chroma_blend);
        new_cr = mix(ycbcr.z, smoothed_chroma.y, chroma_blend);
    }

    // Convert back to RGB
    let new_ycbcr = vec3<f32>(new_luma, new_cb, new_cr);
    var result = ycbcr_to_rgb(new_ycbcr);

    // Ensure valid range
    return max(result, vec3<f32>(0.0));
}

// ============================================================================
// TEXTURE RESCUER (Perona-Malik Anisotropic Diffusion with Multi-Scale)
// ============================================================================

// Perona-Malik diffusion coefficient
// g(gradient) controls how much diffusion happens based on edge strength
// High gradient (edge) -> low diffusion (preserve edge)
// Low gradient (flat) -> high diffusion (smooth noise)
fn perona_malik_coefficient(gradient_mag: f32, kappa: f32) -> f32 {
    // Using the exponential form: g(x) = exp(-(x/kappa)^2)
    // This provides smooth falloff and good edge preservation
    let normalized = gradient_mag / max(kappa, 0.001);
    return exp(-normalized * normalized);
}

// Alternative: Tukey's biweight for more aggressive edge preservation
fn tukey_coefficient(gradient_mag: f32, kappa: f32) -> f32 {
    let x = gradient_mag / max(kappa, 0.001);
    if (x > 1.0) {
        return 0.0;  // No diffusion at strong edges
    }
    let t = 1.0 - x * x;
    return t * t;
}

// Compute gradient at a pixel using central differences
fn compute_gradient(coord: vec2<i32>) -> vec4<f32> {
    // Sample neighbors
    let north = textureLoad(input_texture, coord + vec2<i32>(0, -1), 0).rgb;
    let south = textureLoad(input_texture, coord + vec2<i32>(0, 1), 0).rgb;
    let east = textureLoad(input_texture, coord + vec2<i32>(1, 0), 0).rgb;
    let west = textureLoad(input_texture, coord + vec2<i32>(-1, 0), 0).rgb;
    let center = textureLoad(input_texture, coord, 0).rgb;

    // Compute directional gradients (differences)
    let grad_n = get_luma(north) - get_luma(center);
    let grad_s = get_luma(south) - get_luma(center);
    let grad_e = get_luma(east) - get_luma(center);
    let grad_w = get_luma(west) - get_luma(center);

    return vec4<f32>(grad_n, grad_s, grad_e, grad_w);
}

// Single iteration of anisotropic diffusion
fn diffusion_step(
    coord: vec2<i32>,
    center: vec3<f32>,
    kappa: f32,
    lambda: f32  // Diffusion rate (0-0.25 for stability)
) -> vec3<f32> {
    // Sample neighbors
    let north = textureLoad(input_texture, coord + vec2<i32>(0, -1), 0).rgb;
    let south = textureLoad(input_texture, coord + vec2<i32>(0, 1), 0).rgb;
    let east = textureLoad(input_texture, coord + vec2<i32>(1, 0), 0).rgb;
    let west = textureLoad(input_texture, coord + vec2<i32>(-1, 0), 0).rgb;

    // Compute gradients for each direction
    let center_luma = get_luma(center);
    let grad_n = get_luma(north) - center_luma;
    let grad_s = get_luma(south) - center_luma;
    let grad_e = get_luma(east) - center_luma;
    let grad_w = get_luma(west) - center_luma;

    // Compute diffusion coefficients
    let c_n = perona_malik_coefficient(abs(grad_n), kappa);
    let c_s = perona_malik_coefficient(abs(grad_s), kappa);
    let c_e = perona_malik_coefficient(abs(grad_e), kappa);
    let c_w = perona_malik_coefficient(abs(grad_w), kappa);

    // Apply diffusion update
    // Each channel is updated based on luma-derived coefficients
    let delta_n = (north - center) * c_n;
    let delta_s = (south - center) * c_s;
    let delta_e = (east - center) * c_e;
    let delta_w = (west - center) * c_w;

    return center + lambda * (delta_n + delta_s + delta_e + delta_w);
}

// Multi-scale Gaussian blur for wavelet-like decomposition
fn gaussian_blur_at_scale(coord: vec2<i32>, scale: i32) -> vec3<f32> {
    // Use box filter approximation for speed
    // Scale determines the radius
    var sum = vec3<f32>(0.0);
    var weight_sum: f32 = 0.0;

    let radius = scale;
    let sigma = f32(scale) * 0.5 + 0.5;

    for (var dy = -radius; dy <= radius; dy++) {
        for (var dx = -radius; dx <= radius; dx++) {
            let sample_coord = coord + vec2<i32>(dx, dy);
            let sample = textureLoad(input_texture, sample_coord, 0).rgb;

            // Gaussian weight
            let dist_sq = f32(dx * dx + dy * dy);
            let w = exp(-dist_sq / (2.0 * sigma * sigma));

            sum += sample * w;
            weight_sum += w;
        }
    }

    return sum / max(weight_sum, 0.001);
}

// Extract detail at a specific scale (wavelet-like)
fn extract_scale_detail(coord: vec2<i32>, scale: i32, center: vec3<f32>) -> vec3<f32> {
    let blurred = gaussian_blur_at_scale(coord, scale);
    return center - blurred;  // High-frequency detail at this scale
}

fn apply_texture_rescuer(
    coord: vec2<i32>,
    rgb: vec3<f32>,
    mode: u32,              // 0=sharpen, 1=diffuse, 2=both
    sharpness: f32,         // -100 to +100
    edge_threshold: f32,    // 0-100: controls edge preservation
    iterations: u32,        // 1-32: diffusion iterations
    scale1: f32,            // -100 to +100: fine detail
    scale2: f32,            // -100 to +100: medium-fine detail
    scale3: f32,            // -100 to +100: medium-coarse detail
    scale4: f32             // -100 to +100: coarse detail
) -> vec3<f32> {
    // Skip if no adjustments
    let has_sharpness = abs(sharpness) > 0.1;
    let has_scales = abs(scale1) > 0.1 || abs(scale2) > 0.1 || abs(scale3) > 0.1 || abs(scale4) > 0.1;

    if (!has_sharpness && !has_scales && mode != 1u) {
        return rgb;
    }

    var result = rgb;

    // === DIFFUSION MODE (mode == 1 or mode == 2) ===
    if (mode == 1u || mode == 2u) {
        // Kappa controls edge sensitivity (higher = more edges preserved)
        let kappa = mix(0.01, 0.2, edge_threshold / 100.0);

        // Lambda is the diffusion rate (must be <= 0.25 for stability)
        let lambda: f32 = 0.2;

        // Apply diffusion iterations
        // Note: In a real implementation, this would need ping-pong buffers
        // For GPU single-pass, we approximate with neighborhood sampling
        let effective_iterations = min(iterations, 8u);  // Limit for single-pass

        for (var i = 0u; i < effective_iterations; i++) {
            result = diffusion_step(coord, result, kappa, lambda);
        }
    }

    // === SHARPENING MODE (mode == 0 or mode == 2) ===
    if (mode == 0u || mode == 2u) {
        // For sharpening, we enhance the difference from a blurred version
        let center_luma = get_luma(result);

        // Multi-scale sharpening using wavelet-like decomposition
        var detail_sum = vec3<f32>(0.0);

        // Scale 1: Fine detail (1-pixel radius)
        if (abs(scale1) > 0.1) {
            let detail1 = extract_scale_detail(coord, 1, result);
            detail_sum += detail1 * (scale1 / 100.0);
        }

        // Scale 2: Medium-fine detail (2-pixel radius)
        if (abs(scale2) > 0.1) {
            let detail2 = extract_scale_detail(coord, 2, result);
            detail_sum += detail2 * (scale2 / 100.0);
        }

        // Scale 3: Medium-coarse detail (3-pixel radius)
        if (abs(scale3) > 0.1) {
            let detail3 = extract_scale_detail(coord, 3, result);
            detail_sum += detail3 * (scale3 / 100.0);
        }

        // Scale 4: Coarse detail (4-pixel radius)
        if (abs(scale4) > 0.1) {
            let detail4 = extract_scale_detail(coord, 4, result);
            detail_sum += detail4 * (scale4 / 100.0);
        }

        // Apply overall sharpness
        if (has_sharpness) {
            // Simple unsharp mask using 2-pixel blur as base
            let blurred = gaussian_blur_at_scale(coord, 2);
            let unsharp_detail = result - blurred;

            // Edge-aware sharpening: reduce sharpening on strong edges to prevent halos
            let edge_mag = length(unsharp_detail);
            let edge_factor = 1.0 - smoothstep(0.05, 0.2, edge_mag) * (1.0 - edge_threshold / 100.0);

            detail_sum += unsharp_detail * (sharpness / 100.0) * edge_factor;
        }

        // Apply accumulated detail
        result = result + detail_sum;
    }

    // Ensure valid range
    return max(result, vec3<f32>(0.0));
}

// Simplified version for mask adjustments
fn apply_texture_rescuer_mask(
    coord: vec2<i32>,
    rgb: vec3<f32>,
    sharpness: f32,
    edge_threshold: f32
) -> vec3<f32> {
    // Mask version: sharpen mode only, no wavelet scales
    return apply_texture_rescuer(
        coord,
        rgb,
        0u,             // Sharpen mode
        sharpness,
        edge_threshold,
        1u,             // Single iteration
        0.0, 0.0, 0.0, 0.0  // No wavelet scales
    );
}

// ============================================================================
// SMART DEBLUR (Richardson-Lucy Deconvolution with PSF Generation)
// ============================================================================

// Maximum kernel size for deblurring (performance constraint)
const MAX_DEBLUR_RADIUS: i32 = 50;

// Generate motion blur PSF weight at offset from center
fn motion_blur_psf(offset: vec2<f32>, length: f32, angle_deg: f32) -> f32 {
    // Convert angle to radians
    let angle_rad = angle_deg * 3.14159265359 / 180.0;

    // Direction of motion blur
    let dir = vec2<f32>(cos(angle_rad), sin(angle_rad));

    // Project offset onto motion direction
    let projection = dot(offset, dir);

    // Distance from motion line
    let perpendicular = offset - dir * projection;
    let perp_dist = length(perpendicular);

    // Check if within blur line
    let half_length = length * 0.5;
    if (abs(projection) <= half_length && perp_dist < 1.0) {
        // Weight falls off at edges of blur
        let edge_falloff = 1.0 - perp_dist;
        let length_falloff = 1.0 - smoothstep(half_length * 0.8, half_length, abs(projection));
        return edge_falloff * length_falloff;
    }
    return 0.0;
}

// Generate defocus (out of focus) PSF weight - disk/pillbox
fn defocus_blur_psf(offset: vec2<f32>, radius: f32) -> f32 {
    let dist = length(offset);

    // Disk kernel with soft edge
    if (dist <= radius) {
        // Slight falloff toward edge for more natural look
        return 1.0 - smoothstep(radius * 0.7, radius, dist) * 0.3;
    }
    return 0.0;
}

// Generate Gaussian blur PSF weight
fn gaussian_blur_psf(offset: vec2<f32>, radius: f32) -> f32 {
    let sigma = radius / 2.5;  // Radius encompasses ~2.5 sigma
    let dist_sq = dot(offset, offset);
    return exp(-dist_sq / (2.0 * sigma * sigma));
}

// Get PSF weight based on blur type
fn get_psf_weight(offset: vec2<f32>, blur_type: u32, length: f32, angle: f32, radius: f32) -> f32 {
    switch (blur_type) {
        case 0u: {  // Motion blur
            return motion_blur_psf(offset, length, angle);
        }
        case 1u: {  // Defocus
            return defocus_blur_psf(offset, radius);
        }
        case 2u: {  // Gaussian
            return gaussian_blur_psf(offset, radius);
        }
        default: {
            return 0.0;
        }
    }
}

// Apply blur using PSF (forward model)
fn apply_psf_blur(
    coord: vec2<i32>,
    blur_type: u32,
    length: f32,
    angle: f32,
    radius: f32
) -> vec3<f32> {
    var sum = vec3<f32>(0.0);
    var weight_sum: f32 = 0.0;

    // Determine kernel radius based on blur type
    var kernel_radius: i32;
    if (blur_type == 0u) {
        kernel_radius = i32(ceil(length * 0.5)) + 1;
    } else {
        kernel_radius = i32(ceil(radius)) + 1;
    }
    kernel_radius = min(kernel_radius, MAX_DEBLUR_RADIUS);

    for (var dy = -kernel_radius; dy <= kernel_radius; dy++) {
        for (var dx = -kernel_radius; dx <= kernel_radius; dx++) {
            let offset = vec2<f32>(f32(dx), f32(dy));
            let w = get_psf_weight(offset, blur_type, length, angle, radius);

            if (w > 0.001) {
                let sample_coord = coord + vec2<i32>(dx, dy);
                let sample = textureLoad(input_texture, sample_coord, 0).rgb;
                sum += sample * w;
                weight_sum += w;
            }
        }
    }

    return sum / max(weight_sum, 0.001);
}

// Richardson-Lucy deconvolution iteration
// This is an iterative ML estimation that converges to the deblurred image
fn richardson_lucy_iteration(
    coord: vec2<i32>,
    current_estimate: vec3<f32>,
    original: vec3<f32>,
    blur_type: u32,
    length: f32,
    angle: f32,
    radius: f32,
    noise_damp: f32
) -> vec3<f32> {
    // Step 1: Blur the current estimate (forward model)
    let blurred_estimate = apply_psf_blur(coord, blur_type, length, angle, radius);

    // Step 2: Compute ratio of observed to blurred estimate
    // Add small epsilon for stability, scaled by noise damping
    let epsilon = 0.001 + noise_damp * 0.01;
    let ratio = original / max(blurred_estimate, vec3<f32>(epsilon));

    // Step 3: Correlate ratio with PSF (backward model)
    // This is equivalent to convolving with the flipped PSF
    var correction = vec3<f32>(0.0);
    var weight_sum: f32 = 0.0;

    var kernel_radius: i32;
    if (blur_type == 0u) {
        kernel_radius = i32(ceil(length * 0.5)) + 1;
    } else {
        kernel_radius = i32(ceil(radius)) + 1;
    }
    kernel_radius = min(kernel_radius, MAX_DEBLUR_RADIUS);

    for (var dy = -kernel_radius; dy <= kernel_radius; dy++) {
        for (var dx = -kernel_radius; dx <= kernel_radius; dx++) {
            // Flipped PSF for correlation
            let offset = vec2<f32>(f32(-dx), f32(-dy));
            let w = get_psf_weight(offset, blur_type, length, angle, radius);

            if (w > 0.001) {
                let sample_coord = coord + vec2<i32>(dx, dy);
                // Sample from the ratio image (approximate with current pixel's ratio)
                let sample_original = textureLoad(input_texture, sample_coord, 0).rgb;
                let sample_blurred = apply_psf_blur(sample_coord, blur_type, length, angle, radius);
                let sample_ratio = sample_original / max(sample_blurred, vec3<f32>(epsilon));

                correction += sample_ratio * w;
                weight_sum += w;
            }
        }
    }

    correction = correction / max(weight_sum, 0.001);

    // Step 4: Multiply current estimate by correction
    return current_estimate * correction;
}

// Simplified single-pass deconvolution approximation
// Uses inverse filtering with Wiener-like regularization
fn wiener_deconvolve_approx(
    coord: vec2<i32>,
    rgb: vec3<f32>,
    blur_type: u32,
    length: f32,
    angle: f32,
    radius: f32,
    strength: f32,
    smoothness: f32,
    noise_damp: f32
) -> vec3<f32> {
    // Get the blurred version
    let blurred = apply_psf_blur(coord, blur_type, length, angle, radius);

    // Compute the detail that was lost (high frequency content)
    let lost_detail = rgb - blurred;

    // Estimate local variance for adaptive regularization
    var local_variance: f32 = 0.0;
    for (var dy = -1; dy <= 1; dy++) {
        for (var dx = -1; dx <= 1; dx++) {
            let sample_coord = coord + vec2<i32>(dx, dy);
            let sample = textureLoad(input_texture, sample_coord, 0).rgb;
            let diff = sample - rgb;
            local_variance += dot(diff, diff);
        }
    }
    local_variance = sqrt(local_variance / 9.0);

    // Wiener-like regularization: reduce enhancement in noisy areas
    // Higher noise_damp = more suppression of noise amplification
    let noise_factor = 1.0 / (1.0 + local_variance * noise_damp * 10.0);

    // Smoothness affects how aggressively we restore detail
    // Higher smoothness = less aggressive restoration
    let smooth_factor = 1.0 - smoothness / 100.0;

    // Calculate restoration amount
    let restoration_strength = strength / 100.0 * noise_factor * smooth_factor;

    // Inverse filter approximation: add back the lost detail, amplified
    // The amplification factor depends on the blur strength
    var amplification: f32;
    if (blur_type == 0u) {
        amplification = 1.0 + length * 0.1;
    } else {
        amplification = 1.0 + radius * 0.2;
    }

    let restored_detail = lost_detail * amplification * restoration_strength;

    // Apply restoration
    var result = rgb + restored_detail;

    // Prevent excessive ringing/overshoot
    let max_change = 0.3 * (1.0 - smoothness / 100.0);
    result = clamp(result, rgb - max_change, rgb + max_change);

    return max(result, vec3<f32>(0.0));
}

fn apply_smart_deblur(
    coord: vec2<i32>,
    rgb: vec3<f32>,
    blur_type: u32,      // 0=motion, 1=focus, 2=gaussian
    length: f32,         // Motion blur length in pixels
    angle: f32,          // Motion blur angle in degrees
    radius: f32,         // Focus/gaussian blur radius
    strength: f32,       // 0-100: deconvolution strength
    smoothness: f32,     // 0-100: regularization (prevents ringing)
    noise_damp: f32,     // 0-100: noise suppression
    iterations: u32      // Number of refinement iterations (1-20)
) -> vec3<f32> {
    // Skip if no deblurring needed
    if (strength < 0.1) {
        return rgb;
    }

    // Validate parameters
    let safe_length = max(length, 1.0);
    let safe_radius = max(radius, 1.0);
    let safe_iterations = clamp(iterations, 1u, 20u);

    // Multi-scale iterative refinement approach
    // Each iteration refines the result at progressively finer scales
    var result = rgb;

    for (var i = 0u; i < safe_iterations; i++) {
        // Progressive scale factor: start coarse, refine to fine
        // First iteration uses full blur parameters, subsequent refine residuals
        let iteration_factor = 1.0 - (f32(i) / f32(safe_iterations)) * 0.7;
        let iter_length = safe_length * iteration_factor;
        let iter_radius = safe_radius * iteration_factor;

        // Strength decreases for refinement passes to avoid over-sharpening
        // First pass gets full strength, subsequent passes refine
        let iter_strength = select(
            strength * 0.5,  // Refinement passes use half strength
            strength,        // First pass uses full strength
            i == 0u
        );

        // Smoothness increases slightly for refinement to prevent artifacts
        let iter_smoothness = smoothness + f32(i) * 5.0;

        // Apply deconvolution at this scale
        result = wiener_deconvolve_approx(
            coord,
            result,
            blur_type,
            iter_length,
            angle,
            iter_radius,
            iter_strength,
            min(iter_smoothness, 100.0),
            noise_damp
        );
    }

    return result;
}

// Mask-compatible version
fn apply_smart_deblur_mask(
    coord: vec2<i32>,
    rgb: vec3<f32>,
    strength: f32,
    smoothness: f32
) -> vec3<f32> {
    // Mask version: use gaussian blur type with default parameters
    return apply_smart_deblur(
        coord,
        rgb,
        2u,         // Gaussian blur type
        10.0,       // Default length (unused for gaussian)
        0.0,        // Default angle (unused for gaussian)
        5.0,        // Default radius
        strength,
        smoothness,
        50.0,       // Default noise damping
        5u          // Default iterations for mask
    );
}

fn get_raw_hsl_influence(hue: f32, center: f32, width: f32) -> f32 {
    let dist = min(abs(hue - center), 360.0 - abs(hue - center));
    const sharpness = 1.5; 
    let falloff = dist / (width * 0.5);
    return exp(-sharpness * falloff * falloff);
}

fn hash(p: vec2<f32>) -> f32 {
    var p3  = fract(vec3<f32>(p.xyx) * .1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

fn gradient_noise(p: vec2<f32>) -> f32 {
    let i = floor(p);
    let f = fract(p);
    let u = f * f * f * (f * (f * 6.0 - 15.0) + 10.0);

    let ga = vec2<f32>(hash(i + vec2(0.0, 0.0)), hash(i + vec2(0.0, 0.0) + vec2(11.0, 37.0))) * 2.0 - 1.0;
    let gb = vec2<f32>(hash(i + vec2(1.0, 0.0)), hash(i + vec2(1.0, 0.0) + vec2(11.0, 37.0))) * 2.0 - 1.0;
    let gc = vec2<f32>(hash(i + vec2(0.0, 1.0)), hash(i + vec2(0.0, 1.0) + vec2(11.0, 37.0))) * 2.0 - 1.0;
    let gd = vec2<f32>(hash(i + vec2(1.0, 1.0)), hash(i + vec2(1.0, 1.0) + vec2(11.0, 37.0))) * 2.0 - 1.0;
    
    let dot_00 = dot(ga, f - vec2(0.0, 0.0));
    let dot_10 = dot(gb, f - vec2(1.0, 0.0));
    let dot_01 = dot(gc, f - vec2(0.0, 1.0));
    let dot_11 = dot(gd, f - vec2(1.0, 1.0));
    
    let bottom_interp = mix(dot_00, dot_10, u.x);
    let top_interp = mix(dot_01, dot_11, u.x);
    
    return mix(bottom_interp, top_interp, u.y);
}

fn dither(coords: vec2<u32>) -> f32 {
    let p = vec2<f32>(coords);
    return fract(sin(dot(p, vec2<f32>(12.9898, 78.233))) * 43758.5453) - 0.5;
}

fn interpolate_cubic_hermite(x: f32, p1: Point, p2: Point, m1: f32, m2: f32) -> f32 {
    let dx = p2.x - p1.x;
    if (dx <= 0.0) { return p1.y; }
    let t = (x - p1.x) / dx;
    let t2 = t * t;
    let t3 = t2 * t;
    let h00 = 2.0 * t3 - 3.0 * t2 + 1.0;
    let h10 = t3 - 2.0 * t2 + t;
    let h01 = -2.0 * t3 + 3.0 * t2;
    let h11 = t3 - t2;
    return h00 * p1.y + h10 * m1 * dx + h01 * p2.y + h11 * m2 * dx;
}

fn apply_curve(val: f32, points: array<Point, 16>, count: u32) -> f32 {
    if (count < 2u) { return val; }
    var local_points = points;
    let x = val * 255.0;
    if (x <= local_points[0].x) { return local_points[0].y / 255.0; }
    if (x >= local_points[count - 1u].x) { return local_points[count - 1u].y / 255.0; }
    for (var i = 0u; i < 15u; i = i + 1u) {
        if (i >= count - 1u) { break; }
        let p1 = local_points[i];
        let p2 = local_points[i + 1u];
        if (x <= p2.x) {
            let p0 = local_points[max(0u, i - 1u)];
            let p3 = local_points[min(count - 1u, i + 2u)];
            let delta_before = (p1.y - p0.y) / max(0.001, p1.x - p0.x);
            let delta_current = (p2.y - p1.y) / max(0.001, p2.x - p1.x);
            let delta_after = (p3.y - p2.y) / max(0.001, p3.x - p2.x);
            var tangent_at_p1: f32;
            var tangent_at_p2: f32;
            if (i == 0u) { tangent_at_p1 = delta_current; } else {
                if (delta_before * delta_current <= 0.0) { tangent_at_p1 = 0.0; } else { tangent_at_p1 = (delta_before + delta_current) / 2.0; }
            }
            if (i + 1u == count - 1u) { tangent_at_p2 = delta_current; } else {
                if (delta_current * delta_after <= 0.0) { tangent_at_p2 = 0.0; } else { tangent_at_p2 = (delta_current + delta_after) / 2.0; }
            }
            if (delta_current != 0.0) {
                let alpha = tangent_at_p1 / delta_current;
                let beta = tangent_at_p2 / delta_current;
                if (alpha * alpha + beta * beta > 9.0) {
                    let tau = 3.0 / sqrt(alpha * alpha + beta * beta);
                    tangent_at_p1 = tangent_at_p1 * tau;
                    tangent_at_p2 = tangent_at_p2 * tau;
                }
            }
            let result_y = interpolate_cubic_hermite(x, p1, p2, tangent_at_p1, tangent_at_p2);
            return clamp(result_y / 255.0, 0.0, 1.0);
        }
    }
    return local_points[count - 1u].y / 255.0;
}

fn apply_tonal_adjustments(color: vec3<f32>, con: f32, sh: f32, wh: f32, bl: f32) -> vec3<f32> {
    var rgb = color;
    if (wh != 0.0) {
        let white_level = 1.0 - wh * 0.25;
        rgb = rgb / max(white_level, 0.01);
    }
    if (bl != 0.0) {
        let luma_for_blacks = get_luma(max(rgb, vec3(0.0)));
        let mask = 1.0 - smoothstep(0.0, 0.25, luma_for_blacks);
        if (mask > 0.001) {
            let adjustment = bl * 0.75;
            let factor = pow(2.0, adjustment);
            let adjusted = rgb * factor;
            rgb = mix(rgb, adjusted, mask);
        }
    }
    let luma = get_luma(max(rgb, vec3(0.0)));
    if (sh != 0.0) {
        let mask = pow(1.0 - smoothstep(0.0, 0.4, luma), 3.0);
        if (mask > 0.001) {
            let adjustment = sh * 1.5;
            let factor = pow(2.0, adjustment);
            let adjusted = rgb * factor;
            rgb = mix(rgb, adjusted, mask);
        }
    }
    if (con != 0.0) {
        let safe_rgb = max(rgb, vec3<f32>(0.0));
        let g = 2.2;
        let perceptual = pow(safe_rgb, vec3<f32>(1.0 / g));
        let clamped_perceptual = clamp(perceptual, vec3<f32>(0.0), vec3<f32>(1.0));
        let strength = pow(2.0, con * 1.25);
        let condition = clamped_perceptual < vec3<f32>(0.5);
        let high_part = 1.0 - 0.5 * pow(2.0 * (1.0 - clamped_perceptual), vec3<f32>(strength));
        let low_part = 0.5 * pow(2.0 * clamped_perceptual, vec3<f32>(strength));
        let curved_perceptual = select(high_part, low_part, condition);
        let contrast_adjusted_rgb = pow(curved_perceptual, vec3<f32>(g));
        let mix_factor = smoothstep(vec3<f32>(1.0), vec3<f32>(1.01), safe_rgb);
        rgb = mix(contrast_adjusted_rgb, rgb, mix_factor);
    }
    return rgb;
}

fn apply_linear_exposure(color_in: vec3<f32>, exposure_adj: f32) -> vec3<f32> {
    if (exposure_adj == 0.0) {
        return color_in;
    }
    return color_in * pow(2.0, exposure_adj);
}

fn apply_filmic_exposure(color_in: vec3<f32>, brightness_adj: f32) -> vec3<f32> {
    if (brightness_adj == 0.0) {
        return color_in;
    }
    const RATIONAL_CURVE_MIX: f32 = 0.95;
    const MIDTONE_STRENGTH: f32 = 1.2;
    let original_luma = get_luma(color_in);
    if (abs(original_luma) < 0.00001) {
        return color_in;
    }
    let direct_adj = brightness_adj * (1.0 - RATIONAL_CURVE_MIX);
    let rational_adj = brightness_adj * RATIONAL_CURVE_MIX;
    let scale = pow(2.0, direct_adj);
    let k = pow(2.0, -rational_adj * MIDTONE_STRENGTH);
    let luma_abs = abs(original_luma);
    let luma_floor = floor(luma_abs);
    let luma_fract = luma_abs - luma_floor;
    let shaped_fract = luma_fract / (luma_fract + (1.0 - luma_fract) * k);
    let shaped_luma_abs = luma_floor + shaped_fract;
    let new_luma = sign(original_luma) * shaped_luma_abs * scale;
    let chroma = color_in - vec3<f32>(original_luma);
    let total_luma_scale = new_luma / original_luma;
    let chroma_scale = pow(total_luma_scale, 0.8);
    return vec3<f32>(new_luma) + chroma * chroma_scale;
}

fn apply_highlights_adjustment(
    color_in: vec3<f32>, 
    highlights_adj: f32,
) -> vec3<f32> {
    if (highlights_adj == 0.0) {
        return color_in;
    }
    let luma = get_luma(max(color_in, vec3(0.0)));
    let mask_input = tanh(luma * 1.5); 
    let highlight_mask = smoothstep(0.3, 0.95, mask_input);
    if (highlight_mask < 0.001) {
        return color_in;
    }
    var final_adjusted_color: vec3<f32>;
    if (highlights_adj < 0.0) {
        var new_luma: f32;
        if (luma <= 1.0) {
            let gamma = 1.0 - highlights_adj * 1.75;
            new_luma = pow(luma, gamma);
        } else {
            let luma_excess = luma - 1.0;
            let compression_strength = -highlights_adj * 6.0; 
            let compressed_excess = luma_excess / (1.0 + luma_excess * compression_strength);
            new_luma = 1.0 + compressed_excess;
        }
        
        let tonally_adjusted_color = color_in * (new_luma / max(luma, 0.0001));

        let desaturation_amount = smoothstep(1.0, 10.0, luma);
        let white_point = vec3<f32>(new_luma);
        
        final_adjusted_color = mix(tonally_adjusted_color, white_point, desaturation_amount);

    } else {
        let adjustment = highlights_adj * 1.75;
        let factor = pow(2.0, adjustment);
        final_adjusted_color = color_in * factor;
    }

    return mix(color_in, final_adjusted_color, highlight_mask);
}

fn apply_color_calibration(color: vec3<f32>, cal: ColorCalibrationSettings) -> vec3<f32> {
    let h_r = cal.red_hue;
    let h_g = cal.green_hue;
    let h_b = cal.blue_hue;
    let r_prime = vec3<f32>(1.0 - abs(h_r), max(0.0, h_r), max(0.0, -h_r));
    let g_prime = vec3<f32>(max(0.0, -h_g), 1.0 - abs(h_g), max(0.0, h_g));
    let b_prime = vec3<f32>(max(0.0, h_b), max(0.0, -h_b), 1.0 - abs(h_b));
    let hue_matrix = mat3x3<f32>(r_prime, g_prime, b_prime);
    var c = hue_matrix * color;

    let luma = get_luma(max(vec3(0.0), c));
    let desaturated_color = vec3<f32>(luma);
    let sat_vector = c - desaturated_color;

    let color_sum = c.r + c.g + c.b;
    var masks = vec3<f32>(0.0);
    if (color_sum > 0.001) {
        masks = c / color_sum;
    }

    let total_sat_adjustment =
        masks.r * cal.red_saturation +
        masks.g * cal.green_saturation +
        masks.b * cal.blue_saturation;

    c += sat_vector * total_sat_adjustment;

    let st = cal.shadows_tint;
    if (abs(st) > 0.001) {
        let shadow_luma = get_luma(max(vec3(0.0), c));
        let mask = 1.0 - smoothstep(0.0, 0.3, shadow_luma);
        let tint_mult = vec3<f32>(1.0 + st * 0.25, 1.0 - st * 0.25, 1.0 + st * 0.25);
        c = mix(c, c * tint_mult, mask);
    }

    return c;
}

fn apply_white_balance(color: vec3<f32>, temp: f32, tnt: f32) -> vec3<f32> {
    var rgb = color;
    let temp_kelvin_mult = vec3<f32>(1.0 + temp * 0.2, 1.0 + temp * 0.05, 1.0 - temp * 0.2);
    let tint_mult = vec3<f32>(1.0 + tnt * 0.25, 1.0 - tnt * 0.25, 1.0 + tnt * 0.25);
    rgb *= temp_kelvin_mult * tint_mult;
    return rgb;
}

fn apply_creative_color(color: vec3<f32>, sat: f32, vib: f32) -> vec3<f32> {
    var processed = color;
    let luma = get_luma(processed);
    
    if (sat != 0.0) {
        processed = mix(vec3<f32>(luma), processed, 1.0 + sat);
    }
    if (vib == 0.0) { return processed; }
    let c_max = max(processed.r, max(processed.g, processed.b));
    let c_min = min(processed.r, min(processed.g, processed.b));
    let delta = c_max - c_min;
    if (delta < 0.02) {
        return processed;
    }
    let current_sat = delta / max(c_max, 0.001);
    if (vib > 0.0) {
        let sat_mask = 1.0 - smoothstep(0.4, 0.9, current_sat);
        let hsv = rgb_to_hsv(processed);
        let hue = hsv.x;
        let skin_center = 25.0;
        let hue_dist = min(abs(hue - skin_center), 360.0 - abs(hue - skin_center));
        let is_skin = smoothstep(35.0, 10.0, hue_dist);
        let skin_dampener = mix(1.0, 0.6, is_skin);
        let amount = vib * sat_mask * skin_dampener * 3.0;
        processed = mix(vec3<f32>(luma), processed, 1.0 + amount);
    } else {
        let desat_mask = 1.0 - smoothstep(0.2, 0.8, current_sat);  
        let amount = vib * desat_mask;
        processed = mix(vec3<f32>(luma), processed, 1.0 + amount);
    }
    return processed;
}

fn apply_hsl_panel(color: vec3<f32>, hsl_adjustments: array<HslColor, 8>, coords_i: vec2<i32>) -> vec3<f32> {
    if (distance(color.r, color.g) < 0.001 && distance(color.g, color.b) < 0.001) {
        return color;
    }
    let original_hsv = rgb_to_hsv(color);
    let original_luma = get_luma(color);

    let saturation_mask = smoothstep(0.05, 0.20, original_hsv.y);
    let luminance_weight = smoothstep(0.0, 1.0, original_hsv.y); 

    if (saturation_mask < 0.001 && luminance_weight < 0.001) {
        return color;
    }

    let original_hue = original_hsv.x;

    var raw_influences: array<f32, 8>;
    var total_raw_influence: f32 = 0.0;
    for (var i = 0u; i < 8u; i = i + 1u) {
        let range = HSL_RANGES[i];
        let influence = get_raw_hsl_influence(original_hue, range.center, range.width);
        raw_influences[i] = influence;
        total_raw_influence += influence;
    }

    var total_hue_shift: f32 = 0.0;
    var total_sat_multiplier: f32 = 0.0;
    var total_lum_adjust: f32 = 0.0;

    for (var i = 0u; i < 8u; i = i + 1u) {
        let normalized_influence = raw_influences[i] / total_raw_influence;
        
        let hue_sat_influence = normalized_influence * saturation_mask;
        let luma_influence = normalized_influence * luminance_weight;
        
        total_hue_shift += hsl_adjustments[i].hue * 2.0 * hue_sat_influence;
        total_sat_multiplier += hsl_adjustments[i].saturation * hue_sat_influence;
        total_lum_adjust += hsl_adjustments[i].luminance * luma_influence;
    }

    if (original_hsv.y * (1.0 + total_sat_multiplier) < 0.0001) {
        let final_luma = original_luma * (1.0 + total_lum_adjust);
        return vec3<f32>(final_luma);
    }
    var hsv = original_hsv;
    hsv.x = (hsv.x + total_hue_shift + 360.0) % 360.0;
    hsv.y = clamp(hsv.y * (1.0 + total_sat_multiplier), 0.0, 1.0);
    let hs_shifted_rgb = hsv_to_rgb(vec3<f32>(hsv.x, hsv.y, original_hsv.z));
    let new_luma = get_luma(hs_shifted_rgb);
    let target_luma = original_luma * (1.0 + total_lum_adjust);
    if (new_luma < 0.0001) {
        return vec3<f32>(max(0.0, target_luma));
    }
    let final_color = hs_shifted_rgb * (target_luma / new_luma);
    return final_color;
}

fn apply_color_grading(color: vec3<f32>, shadows: ColorGradeSettings, midtones: ColorGradeSettings, highlights: ColorGradeSettings, blending: f32, balance: f32) -> vec3<f32> {
    let luma = get_luma(max(vec3(0.0), color));
    let base_shadow_crossover = 0.1;
    let base_highlight_crossover = 0.5;
    let balance_range = 0.5;
    let shadow_crossover = base_shadow_crossover + max(0.0, -balance) * balance_range;
    let highlight_crossover = base_highlight_crossover - max(0.0, balance) * balance_range;
    let feather = 0.2 * blending;
    let final_shadow_crossover = min(shadow_crossover, highlight_crossover - 0.01);
    let shadow_mask = 1.0 - smoothstep(final_shadow_crossover - feather, final_shadow_crossover + feather, luma);
    let highlight_mask = smoothstep(highlight_crossover - feather, highlight_crossover + feather, luma);
    let midtone_mask = max(0.0, 1.0 - shadow_mask - highlight_mask);
    var graded_color = color;
    let shadow_sat_strength = 0.3;
    let shadow_lum_strength = 0.5;
    let midtone_sat_strength = 0.6;
    let midtone_lum_strength = 0.8;
    let highlight_sat_strength = 0.8;
    let highlight_lum_strength = 1.0;
    if (shadows.saturation > 0.001) { let tint_rgb = hsv_to_rgb(vec3<f32>(shadows.hue, 1.0, 1.0)); graded_color += (tint_rgb - 0.5) * shadows.saturation * shadow_mask * shadow_sat_strength; }
    graded_color += shadows.luminance * shadow_mask * shadow_lum_strength;
    if (midtones.saturation > 0.001) { let tint_rgb = hsv_to_rgb(vec3<f32>(midtones.hue, 1.0, 1.0)); graded_color += (tint_rgb - 0.5) * midtones.saturation * midtone_mask * midtone_sat_strength; }
    graded_color += midtones.luminance * midtone_mask * midtone_lum_strength;
    if (highlights.saturation > 0.001) { let tint_rgb = hsv_to_rgb(vec3<f32>(highlights.hue, 1.0, 1.0)); graded_color += (tint_rgb - 0.5) * highlights.saturation * highlight_mask * highlight_sat_strength; }
    graded_color += highlights.luminance * highlight_mask * highlight_lum_strength;
    return graded_color;
}

fn apply_local_contrast(
    processed_color_linear: vec3<f32>, 
    blurred_color_input_space: vec3<f32>,
    amount: f32,
    is_raw: u32
) -> vec3<f32> {
    if (amount == 0.0) { 
        return processed_color_linear; 
    }

    let center_luma = get_luma(processed_color_linear);
    let shadow_protection = smoothstep(0.0, 0.1, center_luma);
    let highlight_protection = 1.0 - smoothstep(0.6, 1.0, center_luma);
    let midtone_mask = shadow_protection * highlight_protection;
    if (midtone_mask < 0.001) {
        return processed_color_linear;
    }
    
    var blurred_color_linear: vec3<f32>;
    if (is_raw == 1u) {
        blurred_color_linear = blurred_color_input_space;
    } else {
        blurred_color_linear = srgb_to_linear(blurred_color_input_space);
    }

    let blurred_luma = get_luma(blurred_color_linear);

    let safe_center_luma = max(center_luma, 0.0001);
    let blurred_color = processed_color_linear * (blurred_luma / safe_center_luma);
    var final_color: vec3<f32>;
    if (amount < 0.0) {
        final_color = mix(processed_color_linear, blurred_color, -amount);
    } else {
        let detail_vector = processed_color_linear - blurred_color;
        final_color = processed_color_linear + detail_vector * amount * 1.5;
    }
    return mix(processed_color_linear, final_color, midtone_mask);
}

fn apply_centre_local_contrast(
    color_in: vec3<f32>, 
    centre_amount: f32, 
    coords_i: vec2<i32>, 
    blurred_color_srgb: vec3<f32>,
    is_raw: u32
) -> vec3<f32> {
    if (centre_amount == 0.0) {
        return color_in;
    }
    let full_dims_f = vec2<f32>(textureDimensions(input_texture));
    let coord_f = vec2<f32>(coords_i);
    let midpoint = 0.4;
    let feather = 0.375;
    let aspect = full_dims_f.y / full_dims_f.x;
    let uv_centered = (coord_f / full_dims_f - 0.5) * 2.0;
    let d = length(uv_centered * vec2<f32>(1.0, aspect)) * 0.5;
    let vignette_mask = smoothstep(midpoint - feather, midpoint + feather, d);
    let centre_mask = 1.0 - vignette_mask;

    const CLARITY_SCALE: f32 = 0.9;
    var processed_color = color_in;
    let clarity_strength = centre_amount * (2.0 * centre_mask - 1.0) * CLARITY_SCALE;

    if (abs(clarity_strength) > 0.001) {
        processed_color = apply_local_contrast(processed_color, blurred_color_srgb, clarity_strength, is_raw);
    }
    
    return processed_color;
}

fn apply_centre_tonal_and_color(
    color_in: vec3<f32>, 
    centre_amount: f32, 
    coords_i: vec2<i32>
) -> vec3<f32> {
    if (centre_amount == 0.0) {
        return color_in;
    }
    let full_dims_f = vec2<f32>(textureDimensions(input_texture));
    let coord_f = vec2<f32>(coords_i);
    let midpoint = 0.4;
    let feather = 0.375;
    let aspect = full_dims_f.y / full_dims_f.x;
    let uv_centered = (coord_f / full_dims_f - 0.5) * 2.0;
    let d = length(uv_centered * vec2<f32>(1.0, aspect)) * 0.5;
    let vignette_mask = smoothstep(midpoint - feather, midpoint + feather, d);
    let centre_mask = 1.0 - vignette_mask;

    const EXPOSURE_SCALE: f32 = 0.5;
    const VIBRANCE_SCALE: f32 = 0.4;
    const SATURATION_CENTER_SCALE: f32 = 0.3;
    const SATURATION_EDGE_SCALE: f32 = 0.8;

    var processed_color = color_in;
    
    let exposure_boost = centre_mask * centre_amount * EXPOSURE_SCALE;
    processed_color = apply_filmic_exposure(processed_color, exposure_boost);

    let vibrance_center_boost = centre_mask * centre_amount * VIBRANCE_SCALE;
    let saturation_center_boost = centre_mask * centre_amount * SATURATION_CENTER_SCALE;
    let saturation_edge_effect = -(1.0 - centre_mask) * centre_amount * SATURATION_EDGE_SCALE;
    let total_saturation_effect = saturation_center_boost + saturation_edge_effect;
    processed_color = apply_creative_color(processed_color, total_saturation_effect, vibrance_center_boost);

    return processed_color;
}

fn apply_dehaze(color: vec3<f32>, amount: f32) -> vec3<f32> {
    if (amount == 0.0) { return color; }
    let atmospheric_light = vec3<f32>(0.95, 0.97, 1.0);
    if (amount > 0.0) {
        let dark_channel = min(color.r, min(color.g, color.b));
        let transmission_estimate = 1.0 - dark_channel;
        let t = 1.0 - amount * transmission_estimate;
        let recovered = (color - atmospheric_light) / max(t, 0.1) + atmospheric_light;
        var result = mix(color, recovered, amount);
        result = 0.5 + (result - 0.5) * (1.0 + amount * 0.15);
        let luma = get_luma(result);
        result = mix(vec3<f32>(luma), result, 1.0 + amount * 0.1);
        return result;
    } else {
        return mix(color, atmospheric_light, abs(amount) * 0.7);
    }
}

fn apply_noise_reduction(color: vec3<f32>, coords_i: vec2<i32>, luma_amount: f32, color_amount: f32, scale: f32) -> vec3<f32> {
    if (luma_amount <= 100.0 && color_amount <= 100.0) { return color; } // temporarily disable NR for now
    
    let luma_threshold = 0.1 / scale;
    let color_threshold = 0.2 / scale;

    var accum_color = vec3<f32>(0.0);
    var total_weight = 0.0;
    let center_luma = get_luma(color);
    let max_coords = vec2<i32>(textureDimensions(input_texture) - 1u);
    for (var y = -1; y <= 1; y = y + 1) {
        for (var x = -1; x <= 1; x = x + 1) {
            let offset = vec2<i32>(x, y);
            let sample_coords = clamp(coords_i + offset, vec2<i32>(0), max_coords);
            let sample_color_linear = srgb_to_linear(textureLoad(input_texture, vec2<u32>(sample_coords), 0).rgb);
            var luma_weight = 1.0;
            if (luma_amount > 0.0) { 
                let luma_diff = abs(get_luma(sample_color_linear) - center_luma); 
                luma_weight = 1.0 - smoothstep(0.0, luma_threshold, luma_diff / luma_amount); 
            }
            var color_weight = 1.0;
            if (color_amount > 0.0) { 
                let color_diff = distance(sample_color_linear, color); 
                color_weight = 1.0 - smoothstep(0.0, color_threshold, color_diff / color_amount); 
            }
            let weight = luma_weight * color_weight;
            accum_color += sample_color_linear * weight;
            total_weight += weight;
        }
    }
    if (total_weight > 0.0) { return accum_color / total_weight; }
    return color;
}

fn apply_ca_correction(coords: vec2<u32>, ca_rc: f32, ca_by: f32) -> vec3<f32> {
    let dims = vec2<f32>(textureDimensions(input_texture));
    let center = dims / 2.0;
    let current_pos = vec2<f32>(coords);

    let to_center = current_pos - center;
    let dist = length(to_center);
    
    if (dist == 0.0) {
        return textureLoad(input_texture, coords, 0).rgb;
    }

    let dir = to_center / dist;

    let red_shift = dir * dist * ca_rc;
    let blue_shift = dir * dist * ca_by;

    let red_coords = vec2<i32>(round(current_pos - red_shift));
    let blue_coords = vec2<i32>(round(current_pos - blue_shift));
    let green_coords = vec2<i32>(current_pos);

    let max_coords = vec2<i32>(dims - 1.0);

    let r = textureLoad(input_texture, vec2<u32>(clamp(red_coords, vec2<i32>(0), max_coords)), 0).r;
    let g = textureLoad(input_texture, vec2<u32>(clamp(green_coords, vec2<i32>(0), max_coords)), 0).g;
    let b = textureLoad(input_texture, vec2<u32>(clamp(blue_coords, vec2<i32>(0), max_coords)), 0).b;

    return vec3<f32>(r, g, b);
}

const AGX_EPSILON: f32 = 1.0e-6;
const AGX_MIN_EV: f32 = -15.2;
const AGX_MAX_EV: f32 = 5.0;
const AGX_RANGE_EV: f32 = AGX_MAX_EV - AGX_MIN_EV;
const AGX_GAMMA: f32 = 2.4;
const AGX_SLOPE: f32 = 2.3843;
const AGX_TOE_POWER: f32 = 1.5;
const AGX_SHOULDER_POWER: f32 = 1.5;
const AGX_TOE_TRANSITION_X: f32 = 0.6060606;
const AGX_TOE_TRANSITION_Y: f32 = 0.43446;
const AGX_SHOULDER_TRANSITION_X: f32 = 0.6060606;
const AGX_SHOULDER_TRANSITION_Y: f32 = 0.43446;
const AGX_INTERCEPT: f32 = -1.0112;
const AGX_TOE_SCALE: f32 = -1.0359;
const AGX_SHOULDER_SCALE: f32 = 1.3475;
const AGX_TARGET_BLACK_PRE_GAMMA: f32 = 0.0;
const AGX_TARGET_WHITE_PRE_GAMMA: f32 = 1.0;

fn agx_sigmoid(x: f32, power: f32) -> f32 {
    return x / pow(1.0 + pow(x, power), 1.0 / power);
}

fn agx_scaled_sigmoid(x: f32, scale: f32, slope: f32, power: f32, transition_x: f32, transition_y: f32) -> f32 {
    return scale * agx_sigmoid(slope * (x - transition_x) / scale, power) + transition_y;
}

fn agx_apply_curve_channel(x: f32) -> f32 {
    var result: f32 = 0.0;
    if (x < AGX_TOE_TRANSITION_X) {
        result = agx_scaled_sigmoid(x, AGX_TOE_SCALE, AGX_SLOPE, AGX_TOE_POWER, AGX_TOE_TRANSITION_X, AGX_TOE_TRANSITION_Y);
    } else if (x <= AGX_SHOULDER_TRANSITION_X) {
        result = AGX_SLOPE * x + AGX_INTERCEPT;
    } else {
        result = agx_scaled_sigmoid(x, AGX_SHOULDER_SCALE, AGX_SLOPE, AGX_SHOULDER_POWER, AGX_SHOULDER_TRANSITION_X, AGX_SHOULDER_TRANSITION_Y);
    }
    return clamp(result, AGX_TARGET_BLACK_PRE_GAMMA, AGX_TARGET_WHITE_PRE_GAMMA);
}

fn agx_compress_gamut(c: vec3<f32>) -> vec3<f32> {
    let min_c = min(c.r, min(c.g, c.b));
    if (min_c < 0.0) {
        return c - min_c;
    }
    return c;
}

fn agx_tonemap(c: vec3<f32>) -> vec3<f32> {
    let x_relative = max(c / 0.18, vec3<f32>(AGX_EPSILON));
    let log_encoded = (log2(x_relative) - AGX_MIN_EV) / AGX_RANGE_EV;
    let mapped = clamp(log_encoded, vec3<f32>(0.0), vec3<f32>(1.0));

    var curved: vec3<f32>;
    curved.r = agx_apply_curve_channel(mapped.r);
    curved.g = agx_apply_curve_channel(mapped.g);
    curved.b = agx_apply_curve_channel(mapped.b);

    let final_color = pow(max(curved, vec3<f32>(0.0)), vec3<f32>(AGX_GAMMA));

    return final_color;
}

fn agx_full_transform(color_in: vec3<f32>) -> vec3<f32> {
    let compressed_color = agx_compress_gamut(color_in);
    let color_in_agx_space = adjustments.global.agx_pipe_to_rendering_matrix * compressed_color;
    let tonemapped_agx = agx_tonemap(color_in_agx_space);
    let final_color = adjustments.global.agx_rendering_to_pipe_matrix * tonemapped_agx;
    return final_color;
}

fn legacy_tonemap(c: vec3<f32>) -> vec3<f32> {
    const a: f32 = 2.51;
    const b: f32 = 0.03;
    const c_const: f32 = 2.43;
    const d: f32 = 0.59;
    const e: f32 = 0.14;

    let x = max(c, vec3<f32>(0.0));

    let numerator = x * (a * x + b);
    let denominator = x * (c_const * x + d) + e;

    let tonemapped = select(vec3<f32>(0.0), numerator / denominator, denominator > vec3<f32>(0.00001));

    return clamp(tonemapped, vec3<f32>(0.0), vec3<f32>(1.0));
}

fn no_tonemap(c: vec3<f32>) -> vec3<f32> {
    return c;
}

fn is_default_curve(points: array<Point, 16>, count: u32) -> bool {
    if (count != 2u) {
        return false;
    }
    let p0 = points[0];
    let p1 = points[1];
    return abs(p0.y - 0.0) < 0.1 && abs(p1.y - 255.0) < 0.1;
}

fn apply_all_curves(color: vec3<f32>, luma_curve: array<Point, 16>, luma_curve_count: u32, red_curve: array<Point, 16>, red_curve_count: u32, green_curve: array<Point, 16>, green_curve_count: u32, blue_curve: array<Point, 16>, blue_curve_count: u32) -> vec3<f32> {
    let red_is_default = is_default_curve(red_curve, red_curve_count);
    let green_is_default = is_default_curve(green_curve, green_curve_count);
    let blue_is_default = is_default_curve(blue_curve, blue_curve_count);
    let rgb_curves_are_active = !red_is_default || !green_is_default || !blue_is_default;

    if (rgb_curves_are_active) {
        let color_graded = vec3<f32>(apply_curve(color.r, red_curve, red_curve_count), apply_curve(color.g, green_curve, green_curve_count), apply_curve(color.b, blue_curve, blue_curve_count));
        let luma_initial = get_luma(color);
        let luma_target = apply_curve(luma_initial, luma_curve, luma_curve_count);
        let luma_graded = get_luma(color_graded);
        var final_color: vec3<f32>;
        if (luma_graded > 0.001) { final_color = color_graded * (luma_target / luma_graded); } else { final_color = vec3<f32>(luma_target); }
        let max_comp = max(final_color.r, max(final_color.g, final_color.b));
        if (max_comp > 1.0) { final_color = final_color / max_comp; }
        return final_color;
    } else {
        return vec3<f32>(apply_curve(color.r, luma_curve, luma_curve_count), apply_curve(color.g, luma_curve, luma_curve_count), apply_curve(color.b, luma_curve, luma_curve_count));
    }
}

fn apply_all_adjustments(initial_rgb: vec3<f32>, adj: GlobalAdjustments, coords_i: vec2<i32>, id: vec2<u32>, scale: f32) -> vec3<f32> {
    var processed_rgb = apply_noise_reduction(initial_rgb, coords_i, adj.luma_noise_reduction, adj.color_noise_reduction, scale);

    processed_rgb = apply_dehaze(processed_rgb, adj.dehaze);
    processed_rgb = apply_centre_tonal_and_color(processed_rgb, adj.centre, coords_i);
    processed_rgb = apply_white_balance(processed_rgb, adj.temperature, adj.tint);
    processed_rgb = apply_filmic_exposure(processed_rgb, adj.brightness);
    processed_rgb = apply_tonal_adjustments(processed_rgb, adj.contrast, adj.shadows, adj.whites, adj.blacks);
    processed_rgb = apply_highlights_adjustment(processed_rgb, adj.highlights);

    processed_rgb = apply_color_calibration(processed_rgb, adj.color_calibration);
    processed_rgb = apply_hsl_panel(processed_rgb, adj.hsl, coords_i);
    processed_rgb = apply_color_grading(processed_rgb, adj.color_grading_shadows, adj.color_grading_midtones, adj.color_grading_highlights, adj.color_grading_blending, adj.color_grading_balance);
    processed_rgb = apply_creative_color(processed_rgb, adj.saturation, adj.vibrance);

    return processed_rgb;
}

fn apply_all_mask_adjustments(initial_rgb: vec3<f32>, adj: MaskAdjustments, coords_i: vec2<i32>, id: vec2<u32>, scale: f32, is_raw: u32, tonemapper_mode: u32) -> vec3<f32> {
    var processed_rgb = apply_noise_reduction(initial_rgb, coords_i, adj.luma_noise_reduction, adj.color_noise_reduction, scale);

    processed_rgb = apply_dehaze(processed_rgb, adj.dehaze);
    processed_rgb = apply_linear_exposure(processed_rgb, adj.exposure);
    processed_rgb = apply_white_balance(processed_rgb, adj.temperature, adj.tint);
    processed_rgb = apply_filmic_exposure(processed_rgb, adj.brightness);
    processed_rgb = apply_highlights_adjustment(processed_rgb, adj.highlights);
    processed_rgb = apply_tonal_adjustments(processed_rgb, adj.contrast, adj.shadows, adj.whites, adj.blacks);

    // PID Enhancement: Smart Deblur for masks
    processed_rgb = apply_smart_deblur_mask(
        coords_i,
        processed_rgb,
        adj.deblur_strength,
        adj.deblur_smoothness
    );

    processed_rgb = apply_hsl_panel(processed_rgb, adj.hsl, coords_i);
    processed_rgb = apply_color_grading(processed_rgb, adj.color_grading_shadows, adj.color_grading_midtones, adj.color_grading_highlights, adj.color_grading_blending, adj.color_grading_balance);
    processed_rgb = apply_creative_color(processed_rgb, adj.saturation, adj.vibrance);

    return processed_rgb;
}

fn get_mask_influence(mask_index: u32, coords: vec2<u32>) -> f32 {
    switch (mask_index) {
        case 0u: { return textureLoad(mask0, coords, 0).r; }
        case 1u: { return textureLoad(mask1, coords, 0).r; }
        case 2u: { return textureLoad(mask2, coords, 0).r; }
        case 3u: { return textureLoad(mask3, coords, 0).r; }
        case 4u: { return textureLoad(mask4, coords, 0).r; }
        case 5u: { return textureLoad(mask5, coords, 0).r; }
        case 6u: { return textureLoad(mask6, coords, 0).r; }
        case 7u: { return textureLoad(mask7, coords, 0).r; }
        case 8u: { return textureLoad(mask8, coords, 0).r; }
        case 9u: { return textureLoad(mask9, coords, 0).r; }
        case 10u: { return textureLoad(mask10, coords, 0).r; }
        default: { return 0.0; }
    }
}

@compute @workgroup_size(8, 8, 1)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    let out_dims = vec2<u32>(textureDimensions(output_texture));
    if (id.x >= out_dims.x || id.y >= out_dims.y) { return; }

    const REFERENCE_DIMENSION: f32 = 1080.0;
    let full_dims = vec2<f32>(textureDimensions(input_texture));
    let current_ref_dim = min(full_dims.x, full_dims.y);
    let scale = max(0.1, current_ref_dim / REFERENCE_DIMENSION);

    let absolute_coord = id.xy + vec2<u32>(adjustments.tile_offset_x, adjustments.tile_offset_y);
    let absolute_coord_i = vec2<i32>(absolute_coord);

    // Load raw pixel value
    var color_from_texture = textureLoad(input_texture, absolute_coord, 0).rgb;
    let original_alpha = textureLoad(input_texture, absolute_coord, 0).a;

    // Apply hot pixel correction first (before any other processing)
    if (adjustments.global.hot_pixel_enabled == 1u) {
        color_from_texture = apply_hot_pixel_correction(
            absolute_coord_i,
            color_from_texture,
            adjustments.global.hot_pixel_threshold,
            adjustments.global.hot_pixel_radius,
            adjustments.global.hot_pixel_mode
        );
    }

    // Apply denoiser (ISO-adaptive, after hot pixels, before other processing)
    if (adjustments.global.denoise_enabled == 1u) {
        color_from_texture = apply_denoise(
            absolute_coord_i,
            color_from_texture,
            adjustments.global.denoise_strength,
            adjustments.global.denoise_detail,
            adjustments.global.denoise_chroma,
            adjustments.global.denoise_iso_multiplier
        );
    }

    // PID Enhancement: Smart Deblur (Multi-scale iterative deconvolution)
    if (adjustments.global.deblur_enabled == 1u) {
        color_from_texture = apply_smart_deblur(
            absolute_coord_i,
            color_from_texture,
            adjustments.global.deblur_type,
            adjustments.global.deblur_length,
            adjustments.global.deblur_angle,
            adjustments.global.deblur_radius,
            adjustments.global.deblur_strength,
            adjustments.global.deblur_smoothness,
            adjustments.global.deblur_noise_damp,
            adjustments.global.deblur_iterations
        );
    }

    // Apply chromatic aberration correction
    let ca_rc = adjustments.global.chromatic_aberration_red_cyan;
    let ca_by = adjustments.global.chromatic_aberration_blue_yellow;
    if (abs(ca_rc) > 0.000001 || abs(ca_by) > 0.000001) {
        color_from_texture = apply_ca_correction(absolute_coord, ca_rc, ca_by);
    }

    var initial_linear_rgb: vec3<f32>;
    if (adjustments.global.is_raw_image == 0u) {
        initial_linear_rgb = srgb_to_linear(color_from_texture);
    } else {
        initial_linear_rgb = color_from_texture;
    }

    if (adjustments.global.enable_negative_conversion == 1u) {
        initial_linear_rgb = vec3<f32>(1.0) - initial_linear_rgb;
        let film_base_color = vec3<f32>(adjustments.global.film_base_r, adjustments.global.film_base_g, adjustments.global.film_base_b);
        initial_linear_rgb -= film_base_color;
        let balance_mult = vec3<f32>(1.0 + adjustments.global.negative_red_balance, 1.0 + adjustments.global.negative_green_balance, 1.0 + adjustments.global.negative_blue_balance);
        initial_linear_rgb *= balance_mult;
        initial_linear_rgb = max(initial_linear_rgb, vec3<f32>(0.0));
    }

    let sharpness_blurred = textureLoad(sharpness_blur_texture, id.xy, 0).rgb;
    let clarity_blurred = textureLoad(clarity_blur_texture, id.xy, 0).rgb;
    let structure_blurred = textureLoad(structure_blur_texture, id.xy, 0).rgb;
    
    var locally_contrasted_rgb = initial_linear_rgb;
    locally_contrasted_rgb = apply_local_contrast(locally_contrasted_rgb, sharpness_blurred, adjustments.global.sharpness, adjustments.global.is_raw_image);
    locally_contrasted_rgb = apply_local_contrast(locally_contrasted_rgb, clarity_blurred, adjustments.global.clarity, adjustments.global.is_raw_image);
    locally_contrasted_rgb = apply_local_contrast(locally_contrasted_rgb, structure_blurred, adjustments.global.structure, adjustments.global.is_raw_image);
    locally_contrasted_rgb = apply_centre_local_contrast(locally_contrasted_rgb, adjustments.global.centre, absolute_coord_i, clarity_blurred, adjustments.global.is_raw_image);

    var processed_rgb = apply_linear_exposure(locally_contrasted_rgb, adjustments.global.exposure);

    if (adjustments.global.is_raw_image == 1u && adjustments.global.tonemapper_mode != 1u) {
        var srgb_emulated = linear_to_srgb(processed_rgb);
        const BRIGHTNESS_GAMMA: f32 = 1.1;
        srgb_emulated = pow(srgb_emulated, vec3<f32>(1.0 / BRIGHTNESS_GAMMA));
        const CONTRAST_MIX: f32 = 0.75;
        let contrast_curve = srgb_emulated * srgb_emulated * (3.0 - 2.0 * srgb_emulated);
        srgb_emulated = mix(srgb_emulated, contrast_curve, CONTRAST_MIX);
        processed_rgb = srgb_to_linear(srgb_emulated);
    }

    let globally_adjusted_linear = apply_all_adjustments(processed_rgb, adjustments.global, absolute_coord_i, id.xy, scale);
    var composite_rgb_linear = globally_adjusted_linear;
    for (var i = 0u; i < adjustments.mask_count; i = i + 1u) {
        let influence = get_mask_influence(i, absolute_coord);
        if (influence > 0.001) {
            let mask_adj = adjustments.mask_adjustments[i];

            var mask_base_linear = composite_rgb_linear;
            mask_base_linear = apply_local_contrast(mask_base_linear, sharpness_blurred, mask_adj.sharpness, adjustments.global.is_raw_image);
            mask_base_linear = apply_local_contrast(mask_base_linear, clarity_blurred, mask_adj.clarity, adjustments.global.is_raw_image);
            mask_base_linear = apply_local_contrast(mask_base_linear, structure_blurred, mask_adj.structure, adjustments.global.is_raw_image);

            let mask_adjusted_linear = apply_all_mask_adjustments(mask_base_linear, mask_adj, absolute_coord_i, id.xy, scale, adjustments.global.is_raw_image, adjustments.global.tonemapper_mode);
            composite_rgb_linear = mix(composite_rgb_linear, mask_adjusted_linear, influence);
        }
    }

    var base_srgb: vec3<f32>;
    if (adjustments.global.tonemapper_mode == 1u) {
        base_srgb = agx_full_transform(composite_rgb_linear);
    } else {
        base_srgb = linear_to_srgb(composite_rgb_linear);
    }

    var final_rgb = apply_all_curves(base_srgb,
        adjustments.global.luma_curve, adjustments.global.luma_curve_count,
        adjustments.global.red_curve, adjustments.global.red_curve_count,
        adjustments.global.green_curve, adjustments.global.green_curve_count,
        adjustments.global.blue_curve, adjustments.global.blue_curve_count
    );

    for (var i = 0u; i < adjustments.mask_count; i = i + 1u) {
        let influence = get_mask_influence(i, absolute_coord);
        if (influence > 0.001) {
            let mask_curved_srgb = apply_all_curves(final_rgb,
                adjustments.mask_adjustments[i].luma_curve, adjustments.mask_adjustments[i].luma_curve_count,
                adjustments.mask_adjustments[i].red_curve, adjustments.mask_adjustments[i].red_curve_count,
                adjustments.mask_adjustments[i].green_curve, adjustments.mask_adjustments[i].green_curve_count,
                adjustments.mask_adjustments[i].blue_curve, adjustments.mask_adjustments[i].blue_curve_count
            );
            final_rgb = mix(final_rgb, mask_curved_srgb, influence);
        }
    }

    if (adjustments.global.has_lut == 1u) {
        let lut_color = textureSampleLevel(lut_texture, lut_sampler, final_rgb, 0.0).rgb;
        final_rgb = mix(final_rgb, lut_color, adjustments.global.lut_intensity);
    }

    if (adjustments.global.grain_amount > 0.0) {
        let g = adjustments.global;
        let coord = vec2<f32>(absolute_coord_i);
        let amount = g.grain_amount * 0.5;
        let grain_frequency = (1.0 / max(g.grain_size, 0.1)) / scale;
        let roughness = g.grain_roughness;
        let luma = max(0.0, get_luma(final_rgb));
        let luma_mask = smoothstep(0.0, 0.15, luma) * (1.0 - smoothstep(0.6, 1.0, luma));
        let base_coord = coord * grain_frequency;
        let rough_coord = coord * grain_frequency * 0.6;
        let noise_base = gradient_noise(base_coord);
        let noise_rough = gradient_noise(rough_coord + vec2<f32>(5.2, 1.3)); 
        let noise_val = mix(noise_base, noise_rough, roughness);
        final_rgb += vec3<f32>(noise_val) * amount * luma_mask;
    }

    let g = adjustments.global;
    if (g.vignette_amount != 0.0) {
        let full_dims_f = vec2<f32>(textureDimensions(input_texture));
        let coord_f = vec2<f32>(absolute_coord);
        let v_amount = g.vignette_amount;
        let v_mid = g.vignette_midpoint;
        let v_round = 1.0 - g.vignette_roundness;
        let v_feather = g.vignette_feather * 0.5;
        let aspect = full_dims_f.y / full_dims_f.x;
        let uv_centered = (coord_f / full_dims_f - 0.5) * 2.0;
        let uv_round = sign(uv_centered) * pow(abs(uv_centered), vec2<f32>(v_round, v_round));
        let d = length(uv_round * vec2<f32>(1.0, aspect)) * 0.5;
        let vignette_mask = smoothstep(v_mid - v_feather, v_mid + v_feather, d);
        if (v_amount < 0.0) { final_rgb *= (1.0 + v_amount * vignette_mask); } else { final_rgb = mix(final_rgb, vec3<f32>(1.0), v_amount * vignette_mask); }
    }

    if (adjustments.global.show_clipping == 1u) {
        let HIGHLIGHT_WARNING_COLOR = vec3<f32>(1.0, 0.0, 0.0);
        let SHADOW_WARNING_COLOR = vec3<f32>(0.0, 0.0, 1.0);
        let HIGHLIGHT_CLIP_THRESHOLD = 0.998;
        let SHADOW_CLIP_THRESHOLD = 0.002;
        if (any(final_rgb > vec3<f32>(HIGHLIGHT_CLIP_THRESHOLD))) {
            final_rgb = HIGHLIGHT_WARNING_COLOR;
        } else if (any(final_rgb < vec3<f32>(SHADOW_CLIP_THRESHOLD))) {
            final_rgb = SHADOW_WARNING_COLOR;
        }
    }

    let dither_amount = 1.0 / 255.0;
    final_rgb += dither(id.xy) * dither_amount;

    // Kernel visualization overlay (bottom-right corner)
    if (adjustments.global.deblur_show_kernel == 1u && adjustments.global.deblur_enabled == 1u) {
        let preview_size = adjustments.global.deblur_preview_size;
        let padding: f32 = 20.0;
        let border: f32 = 2.0;

        // Calculate overlay position (bottom-right corner)
        let overlay_right = f32(out_dims.x) - padding;
        let overlay_bottom = f32(out_dims.y) - padding;
        let overlay_left = overlay_right - preview_size;
        let overlay_top = overlay_bottom - preview_size;

        let pixel_x = f32(id.x);
        let pixel_y = f32(id.y);

        // Check if pixel is within overlay region
        if (pixel_x >= overlay_left - border && pixel_x <= overlay_right + border &&
            pixel_y >= overlay_top - border && pixel_y <= overlay_bottom + border) {

            // Draw border
            if (pixel_x < overlay_left || pixel_x > overlay_right ||
                pixel_y < overlay_top || pixel_y > overlay_bottom) {
                final_rgb = vec3<f32>(0.8, 0.8, 0.8);  // Light gray border
            } else {
                // Inside overlay - draw kernel visualization
                let overlay_center_x = (overlay_left + overlay_right) * 0.5;
                let overlay_center_y = (overlay_top + overlay_bottom) * 0.5;

                // Position relative to overlay center
                let rel_x = pixel_x - overlay_center_x;
                let rel_y = pixel_y - overlay_center_y;

                // Scale factor to fit kernel in preview
                let blur_type = adjustments.global.deblur_type;
                var max_extent: f32;
                if (blur_type == 0u) {
                    max_extent = adjustments.global.deblur_length * 0.5 + 5.0;
                } else {
                    max_extent = adjustments.global.deblur_radius + 5.0;
                }
                let scale = (preview_size * 0.4) / max(max_extent, 1.0);

                // Scale relative position to kernel space
                let kernel_x = rel_x / scale;
                let kernel_y = rel_y / scale;
                let offset = vec2<f32>(kernel_x, kernel_y);

                // Get PSF weight at this position
                let psf_weight = get_psf_weight(
                    offset,
                    blur_type,
                    adjustments.global.deblur_length,
                    adjustments.global.deblur_angle,
                    adjustments.global.deblur_radius
                );

                // Dark background with bright kernel visualization
                let bg_color = vec3<f32>(0.1, 0.1, 0.15);

                // Color based on blur type
                var kernel_color: vec3<f32>;
                if (blur_type == 0u) {
                    kernel_color = vec3<f32>(1.0, 0.5, 0.2);  // Orange for motion
                } else if (blur_type == 1u) {
                    kernel_color = vec3<f32>(0.2, 0.7, 1.0);  // Blue for defocus
                } else {
                    kernel_color = vec3<f32>(0.5, 1.0, 0.5);  // Green for gaussian
                }

                // Draw crosshairs at center
                let crosshair_dist = max(abs(rel_x), abs(rel_y));
                let on_crosshair = (abs(rel_x) < 1.0 || abs(rel_y) < 1.0) && crosshair_dist < preview_size * 0.45;
                let crosshair_color = vec3<f32>(0.3, 0.3, 0.35);

                // Combine: background + crosshair + kernel
                final_rgb = bg_color;
                if (on_crosshair) {
                    final_rgb = crosshair_color;
                }
                final_rgb = mix(final_rgb, kernel_color, psf_weight);

                // Draw angle indicator for motion blur
                if (blur_type == 0u) {
                    let angle_rad = adjustments.global.deblur_angle * 3.14159265359 / 180.0;
                    let dir = vec2<f32>(cos(angle_rad), sin(angle_rad));
                    let proj = dot(vec2<f32>(rel_x, rel_y), dir);
                    let perp = length(vec2<f32>(rel_x, rel_y) - dir * proj);
                    if (perp < 2.0 && abs(proj) < preview_size * 0.45) {
                        final_rgb = mix(final_rgb, vec3<f32>(0.5, 0.5, 0.5), 0.3);
                    }
                }
            }
        }
    }

    textureStore(output_texture, id.xy, vec4<f32>(clamp(final_rgb, vec3<f32>(0.0), vec3<f32>(1.0)), original_alpha));
}