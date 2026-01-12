import { useMemo } from 'react';
import { Info, Zap } from 'lucide-react';
import Slider from '../ui/Slider';
import Switch from '../ui/Switch';
import { Adjustments, LowLightAdjustment } from '../../utils/adjustments';
import { AppSettings } from '../ui/AppProperties';

interface LowLightRecoveryPanelProps {
  adjustments: Adjustments;
  isForMask?: boolean;
  setAdjustments(adjustments: Partial<Adjustments>): any;
  appSettings: AppSettings | null;
  imageIso?: number | null;
}

// Calculate ISO-based strength multiplier
function calculateIsoMultiplier(iso: number | null | undefined): number {
  if (!iso || iso <= 0) return 1.0;

  // ISO mapping:
  // ISO 100-400:   multiplier 0.3 - 0.5 (low noise, gentle denoise)
  // ISO 800-1600:  multiplier 0.6 - 0.8 (moderate noise)
  // ISO 3200-6400: multiplier 0.9 - 1.2 (high noise)
  // ISO 12800+:    multiplier 1.3 - 1.5 (very high noise, aggressive denoise)

  const logIso = Math.log2(iso / 100); // 0 at ISO 100, increases logarithmically

  if (iso <= 400) {
    return 0.3 + (logIso / 2) * 0.2; // 0.3 to 0.5
  } else if (iso <= 1600) {
    return 0.5 + ((logIso - 2) / 2) * 0.3; // 0.5 to 0.8
  } else if (iso <= 6400) {
    return 0.8 + ((logIso - 4) / 2) * 0.4; // 0.8 to 1.2
  } else {
    return Math.min(1.5, 1.2 + ((logIso - 6) / 2) * 0.3); // 1.2 to 1.5 max
  }
}

export default function LowLightRecoveryPanel({
  adjustments,
  setAdjustments,
  isForMask = false,
  appSettings,
  imageIso,
}: LowLightRecoveryPanelProps) {
  const handleAdjustmentChange = (key: LowLightAdjustment, value: string) => {
    const numericValue = parseFloat(value);
    setAdjustments((prev: Partial<Adjustments>) => ({ ...prev, [key]: numericValue }));
  };

  const handleCheckedChange = (key: LowLightAdjustment, checked: boolean) => {
    setAdjustments((prev: Partial<Adjustments>) => ({ ...prev, [key]: checked }));
  };

  const adjustmentVisibility = appSettings?.adjustmentVisibility || {};

  // Calculate ISO multiplier for display
  const isoMultiplier = useMemo(() => calculateIsoMultiplier(imageIso), [imageIso]);

  // Calculate effective strength when Auto ISO is enabled
  const effectiveStrength = useMemo(() => {
    if (adjustments.denoiseAutoIso && imageIso) {
      return Math.round(adjustments.denoiseStrength * isoMultiplier);
    }
    return adjustments.denoiseStrength;
  }, [adjustments.denoiseStrength, adjustments.denoiseAutoIso, imageIso, isoMultiplier]);

  return (
    <div>
      {/* Workflow hint */}
      <div className="mb-4 p-2 bg-bg-secondary rounded-md flex items-start gap-2">
        <Info size={14} className="text-text-secondary mt-0.5 flex-shrink-0" />
        <p className="text-xs text-text-secondary">
          Recommended order: Hot Pixels → Denoise. Apply early in your workflow for best results.
        </p>
      </div>

      {/* 1. Hot Pixels */}
      {adjustmentVisibility.hotPixels !== false && (
        <div className="mb-4 p-2 bg-bg-tertiary rounded-md">
          <div className="flex items-center justify-between mb-2">
            <p className="text-sm font-medium text-text-primary">Hot Pixels</p>
            <Switch
              id="hot-pixel-toggle"
              label=""
              checked={!!adjustments.hotPixelEnabled}
              onChange={(checked: boolean) => handleCheckedChange(LowLightAdjustment.HotPixelEnabled, checked)}
            />
          </div>
          {adjustments.hotPixelEnabled && (
            <div className="space-y-2 pt-2 border-t border-bg-secondary">
              <Slider
                label="Detection Threshold"
                max={100}
                min={0}
                onChange={(e: any) => handleAdjustmentChange(LowLightAdjustment.HotPixelThreshold, e.target.value)}
                step={1}
                value={adjustments.hotPixelThreshold}
                defaultValue={50}
              />
              <Slider
                label="Search Radius"
                max={5}
                min={1}
                onChange={(e: any) => handleAdjustmentChange(LowLightAdjustment.HotPixelRadius, e.target.value)}
                step={1}
                value={adjustments.hotPixelRadius}
                defaultValue={2}
              />
            </div>
          )}
        </div>
      )}

      {/* 2. Denoiser (ISO-adaptive) */}
      {adjustmentVisibility.denoise !== false && (
        <div className="mb-4 p-2 bg-bg-tertiary rounded-md">
          <div className="flex items-center justify-between mb-2">
            <p className="text-sm font-medium text-text-primary">Denoiser</p>
            <Switch
              id="denoise-toggle"
              label=""
              checked={!!adjustments.denoiseEnabled}
              onChange={(checked: boolean) => handleCheckedChange(LowLightAdjustment.DenoiseEnabled, checked)}
            />
          </div>
          {adjustments.denoiseEnabled && (
            <div className="space-y-2 pt-2 border-t border-bg-secondary">
              {/* Auto ISO toggle */}
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <Zap size={14} className={adjustments.denoiseAutoIso ? 'text-primary' : 'text-text-secondary'} />
                  <label className="text-sm font-medium text-text-primary">Auto (ISO-based)</label>
                </div>
                <Switch
                  id="denoise-auto-iso-toggle"
                  label=""
                  checked={!!adjustments.denoiseAutoIso}
                  onChange={(checked: boolean) => handleCheckedChange(LowLightAdjustment.DenoiseAutoIso, checked)}
                />
              </div>

              {/* ISO info when Auto is enabled */}
              {adjustments.denoiseAutoIso && (
                <div className="p-2 bg-bg-secondary rounded text-xs text-text-secondary">
                  {imageIso ? (
                    <span>
                      ISO {imageIso} → {isoMultiplier.toFixed(2)}x multiplier
                      {effectiveStrength !== adjustments.denoiseStrength && (
                        <span className="text-primary ml-1">
                          (effective: {effectiveStrength}%)
                        </span>
                      )}
                    </span>
                  ) : (
                    <span className="text-yellow-500">No ISO data available - using manual strength</span>
                  )}
                </div>
              )}

              <Slider
                label="Denoise Strength"
                max={100}
                min={0}
                onChange={(e: any) => handleAdjustmentChange(LowLightAdjustment.DenoiseStrength, e.target.value)}
                step={1}
                value={adjustments.denoiseStrength}
                defaultValue={50}
              />
              <Slider
                label="Detail Preservation"
                max={100}
                min={0}
                onChange={(e: any) => handleAdjustmentChange(LowLightAdjustment.DenoiseDetail, e.target.value)}
                step={1}
                value={adjustments.denoiseDetail}
                defaultValue={50}
              />
              <Slider
                label="Chroma Smoothing"
                max={100}
                min={0}
                onChange={(e: any) => handleAdjustmentChange(LowLightAdjustment.DenoiseChroma, e.target.value)}
                step={1}
                value={adjustments.denoiseChroma}
                defaultValue={50}
              />
            </div>
          )}
        </div>
      )}

    </div>
  );
}
