import { Info } from 'lucide-react';

interface UpscalePanelProps {
  onApplyUpscale?: () => void;
  isUpscaled?: boolean;
  isUpscaling?: boolean;
}

export default function UpscalePanel({
  onApplyUpscale,
  isUpscaled = false,
  isUpscaling = false,
}: UpscalePanelProps) {
  return (
    <div>
      <div className="mb-4 p-2 bg-bg-secondary rounded-md flex items-start gap-2">
        <Info size={14} className="text-text-secondary mt-0.5 flex-shrink-0" />
        <p className="text-xs text-text-secondary">
          Doubles image resolution using high-quality Lanczos interpolation. Saves as a new file and auto-loads it.
        </p>
      </div>

      <div className="p-2 bg-bg-tertiary rounded-md">
        <p className="text-md font-semibold mb-2 text-primary">2x Upscale</p>
        <button
          className={`w-full py-2 px-4 rounded font-medium text-sm transition-colors border-2 ${
            isUpscaled
              ? 'bg-green-600/20 text-green-400 border-green-600 cursor-not-allowed'
              : isUpscaling
              ? 'bg-gray-500/20 text-gray-300 border-gray-500 cursor-wait'
              : 'bg-transparent text-primary border-primary hover:bg-primary hover:text-white'
          }`}
          onClick={onApplyUpscale}
          disabled={isUpscaled || isUpscaling}
        >
          {isUpscaled ? 'Applied' : isUpscaling ? 'Upscaling...' : 'Apply'}
        </button>
        {isUpscaled && (
          <p className="text-xs text-text-secondary mt-2">This image has already been upscaled.</p>
        )}
      </div>
    </div>
  );
}
