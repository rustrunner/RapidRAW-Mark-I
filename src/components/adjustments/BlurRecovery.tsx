import { Info } from 'lucide-react';
import Slider from '../ui/Slider';
import Switch from '../ui/Switch';
import { Adjustments, BlurRecoveryAdjustment } from '../../utils/adjustments';
import { AppSettings } from '../ui/AppProperties';

interface BlurRecoveryPanelProps {
  adjustments: Adjustments;
  isForMask?: boolean;
  setAdjustments(adjustments: Partial<Adjustments>): any;
  appSettings: AppSettings | null;
}

export default function BlurRecoveryPanel({
  adjustments,
  setAdjustments,
  isForMask = false,
  appSettings,
}: BlurRecoveryPanelProps) {
  const handleAdjustmentChange = (key: BlurRecoveryAdjustment, value: string) => {
    const numericValue = parseFloat(value);
    setAdjustments((prev: Partial<Adjustments>) => ({ ...prev, [key]: numericValue }));
  };

  const handleCheckedChange = (key: BlurRecoveryAdjustment, checked: boolean) => {
    setAdjustments((prev: Partial<Adjustments>) => ({ ...prev, [key]: checked }));
  };

  const handleSelectChange = (key: BlurRecoveryAdjustment, value: string) => {
    setAdjustments((prev: Partial<Adjustments>) => ({ ...prev, [key]: value }));
  };

  // Show angle overlay when dragging the angle slider
  const handleAngleSliderStart = () => {
    setAdjustments((prev: Partial<Adjustments>) => ({ ...prev, deblurShowAngleOverlay: true }));
  };

  const handleAngleSliderEnd = () => {
    setAdjustments((prev: Partial<Adjustments>) => ({ ...prev, deblurShowAngleOverlay: false }));
  };

  const adjustmentVisibility = appSettings?.adjustmentVisibility || {};

  // Determine which blur-specific controls to show based on blur type
  const showMotionControls = adjustments.deblurType === 'motion';
  const showFocusControls = adjustments.deblurType === 'focus';

  return (
    <div>
      {/* Info about blur reduction features */}
      <div className="mb-4 p-2 bg-bg-secondary rounded-md flex items-start gap-2">
        <Info size={14} className="text-text-secondary mt-0.5 flex-shrink-0" />
        <p className="text-xs text-text-secondary">
          Mathematical deconvolution recovers actual image data without hallucinating details. Ideal for license plates and documents.
        </p>
      </div>

      {/* Smart Deblur */}
      {adjustmentVisibility.smartDeblur !== false && (
        <div className="p-2 bg-bg-tertiary rounded-md">
          <p className="text-md font-semibold mb-2 text-primary">Smart Deblur</p>

          <div className="mb-2">
            <Switch
              label="Enable Deblur"
              checked={!!adjustments.deblurEnabled}
              onChange={(checked: boolean) => handleCheckedChange(BlurRecoveryAdjustment.DeblurEnabled, checked)}
            />
          </div>

          {adjustments.deblurEnabled && (
            <div className="space-y-2 mt-2 pt-2 border-t border-bg-secondary">
              {/* Blur Type Selection */}
              <div className="flex items-center justify-between">
                <label className="text-sm font-medium text-text-primary">Blur Type</label>
                <select
                  className="bg-surface text-text-primary text-sm rounded px-2 py-1 border border-border-color cursor-pointer"
                  value={adjustments.deblurType}
                  onChange={(e) => handleSelectChange(BlurRecoveryAdjustment.DeblurType, e.target.value)}
                >
                  <option value="motion">Motion Blur</option>
                  <option value="focus">Out of Focus</option>
                </select>
              </div>

              {/* Motion Blur Settings */}
              {showMotionControls && (
                <div className="space-y-2 p-2 bg-bg-secondary rounded">
                  <p className="text-xs text-text-secondary font-medium">Motion Blur Settings</p>
                  {/* Blur Length - discrete buttons for better performance */}
                  <div>
                    <label className="text-sm font-medium text-text-primary mb-1 block">Blur Length (px)</label>
                    <div className="flex gap-1 flex-wrap">
                      {[
                        { label: '25', value: 25 },
                        { label: '50', value: 50 },
                        { label: '75', value: 75 },
                        { label: '100', value: 100 },
                      ].map((option) => (
                        <button
                          key={option.value}
                          className={`px-3 py-1 text-xs rounded transition-colors ${
                            adjustments.deblurLength === option.value
                              ? 'bg-primary text-white'
                              : 'bg-surface text-text-primary hover:bg-bg-secondary border border-border-color'
                          }`}
                          onClick={() => handleAdjustmentChange(BlurRecoveryAdjustment.DeblurLength, String(option.value))}
                        >
                          {option.label}
                        </button>
                      ))}
                    </div>
                  </div>
                  <div
                    onPointerDown={handleAngleSliderStart}
                    onPointerUp={handleAngleSliderEnd}
                    onPointerLeave={handleAngleSliderEnd}
                  >
                    <Slider
                      label="Blur Angle"
                      max={180}
                      min={0}
                      onChange={(e: any) => handleAdjustmentChange(BlurRecoveryAdjustment.DeblurAngle, e.target.value)}
                      step={1}
                      value={adjustments.deblurAngle}
                      defaultValue={0}
                    />
                  </div>
                </div>
              )}

              {/* Out of Focus Blur Settings */}
              {showFocusControls && (
                <div className="space-y-2 p-2 bg-bg-secondary rounded">
                  <p className="text-xs text-text-secondary font-medium">Defocus Settings</p>
                  {/* Blur Radius - discrete buttons */}
                  <div>
                    <label className="text-sm font-medium text-text-primary mb-1 block">Blur Radius (px)</label>
                    <div className="flex gap-1">
                      {[
                        { label: '25', value: 25 },
                        { label: '50', value: 50 },
                        { label: '75', value: 75 },
                        { label: '100', value: 100 },
                      ].map((option) => (
                        <button
                          key={option.value}
                          className={`flex-1 px-3 py-1 text-xs rounded transition-colors ${
                            adjustments.deblurRadius === option.value
                              ? 'bg-primary text-white'
                              : 'bg-surface text-text-primary hover:bg-bg-secondary border border-border-color'
                          }`}
                          onClick={() => handleAdjustmentChange(BlurRecoveryAdjustment.DeblurRadius, String(option.value))}
                        >
                          {option.label}
                        </button>
                      ))}
                    </div>
                  </div>
                </div>
              )}

              {/* Deconvolution Settings */}
              <div className="space-y-2 p-2 bg-bg-secondary rounded">
                <p className="text-xs text-text-secondary font-medium">Deconvolution</p>
                <Slider
                  label="Strength"
                  max={100}
                  min={0}
                  onChange={(e: any) => handleAdjustmentChange(BlurRecoveryAdjustment.DeblurStrength, e.target.value)}
                  step={1}
                  value={adjustments.deblurStrength}
                  defaultValue={50}
                />
                <Slider
                  label="Smoothness"
                  max={100}
                  min={0}
                  onChange={(e: any) => handleAdjustmentChange(BlurRecoveryAdjustment.DeblurSmoothness, e.target.value)}
                  step={1}
                  value={adjustments.deblurSmoothness}
                  defaultValue={30}
                />
                <Slider
                  label="Noise Damping"
                  max={100}
                  min={0}
                  onChange={(e: any) => handleAdjustmentChange(BlurRecoveryAdjustment.DeblurNoiseDamp, e.target.value)}
                  step={1}
                  value={adjustments.deblurNoiseDamp}
                  defaultValue={50}
                />
              </div>

            </div>
          )}
        </div>
      )}
    </div>
  );
}
