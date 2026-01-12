import { Crop } from 'react-image-crop';
import { v4 as uuidv4 } from 'uuid';
import { SubMask, SubMaskMode } from '../components/panel/right/Masks';

export enum ActiveChannel {
  Blue = 'blue',
  Green = 'green',
  Luma = 'luma',
  Red = 'red',
}

export enum DisplayMode {
  Blue = 'blue',
  Green = 'green',
  Luma = 'luma',
  Red = 'red',
  Rgb = 'rgb',
}

export enum PasteMode {
  Merge = 'merge',
  Replace = 'replace',
}

export interface CopyPasteSettings {
  mode: PasteMode;
  includedAdjustments: Array<string>;
}

export enum BasicAdjustment {
  Blacks = 'blacks',
  Brightness = 'brightness',
  Contrast = 'contrast',
  Exposure = 'exposure',
  Highlights = 'highlights',
  Shadows = 'shadows',
  Whites = 'whites',
}

export enum ColorAdjustment {
  ColorGrading = 'colorGrading',
  Hsl = 'hsl',
  Hue = 'hue',
  Luminance = 'luminance',
  Saturation = 'saturation',
  Temperature = 'temperature',
  Tint = 'tint',
  Vibrance = 'vibrance',
}

export enum ColorGrading {
  Balance = 'balance',
  Blending = 'blending',
  Highlights = 'highlights',
  Midtones = 'midtones',
  Shadows = 'shadows',
}

export enum DetailsAdjustment {
  Clarity = 'clarity',
  Dehaze = 'dehaze',
  Structure = 'structure',
  Centré = 'centré',
  ColorNoiseReduction = 'colorNoiseReduction',
  LumaNoiseReduction = 'lumaNoiseReduction',
  Sharpness = 'sharpness',
  ChromaticAberrationRedCyan = 'chromaticAberrationRedCyan',
  ChromaticAberrationBlueYellow = 'chromaticAberrationBlueYellow',
}

export enum Effect {
  EnableNegativeConversion = 'enableNegativeConversion',
  FilmBaseColor = 'filmBaseColor',
  GrainAmount = 'grainAmount',
  GrainRoughness = 'grainRoughness',
  GrainSize = 'grainSize',
  LutIntensity = 'lutIntensity',
  NegativeBlueBalance = 'negativeBlueBalance',
  NegativeGreenBalance = 'negativeGreenBalance',
  NegativeRedBalance = 'negativeRedBalance',
  VignetteAmount = 'vignetteAmount',
  VignetteFeather = 'vignetteFeather',
  VignetteMidpoint = 'vignetteMidpoint',
  VignetteRoundness = 'vignetteRoundness',
}

// Low-Light Recovery Adjustments
export enum LowLightAdjustment {
  // Hot Pixels
  HotPixelEnabled = 'hotPixelEnabled',
  HotPixelThreshold = 'hotPixelThreshold',
  HotPixelRadius = 'hotPixelRadius',
  HotPixelMode = 'hotPixelMode',
  // Denoiser (ISO-adaptive)
  DenoiseEnabled = 'denoiseEnabled',
  DenoiseAutoIso = 'denoiseAutoIso',
  DenoiseStrength = 'denoiseStrength',
  DenoiseDetail = 'denoiseDetail',
  DenoiseChroma = 'denoiseChroma',
}

// Blur Recovery Adjustments
export enum BlurRecoveryAdjustment {
  DeblurEnabled = 'deblurEnabled',
  DeblurType = 'deblurType',
  DeblurLength = 'deblurLength',
  DeblurAngle = 'deblurAngle',
  DeblurRadius = 'deblurRadius',
  DeblurStrength = 'deblurStrength',
  DeblurSmoothness = 'deblurSmoothness',
  DeblurNoiseDamp = 'deblurNoiseDamp',
  DeblurPreviewSize = 'deblurPreviewSize',
  DeblurShowKernel = 'deblurShowKernel',
  DeblurShowAngleOverlay = 'deblurShowAngleOverlay',
  DeblurIterations = 'deblurIterations',
  Upscale2xEnabled = 'upscale2xEnabled',
}

export interface ColorCalibration {
  shadowsTint: number;
  redHue: number;
  redSaturation: number;
  greenHue: number;
  greenSaturation: number;
  blueHue: number;
  blueSaturation: number;
}

export interface Adjustments {
  [index: string]: any;
  aiPatches: Array<AiPatch>;
  aspectRatio: number | null;
  blacks: number;
  brightness: number;
  centré: number;
  clarity: number;
  chromaticAberrationBlueYellow: number;
  chromaticAberrationRedCyan: number;
  colorCalibration: ColorCalibration;
  colorGrading: ColorGradingProps;
  colorNoiseReduction: number;
  contrast: number;
  curves: Curves;
  crop: Crop | null;
  dehaze: number;
  enableNegativeConversion: boolean;
  exposure: number;
  filmBaseColor: string;
  flipHorizontal: boolean;
  flipVertical: boolean;
  grainAmount: number;
  grainRoughness: number;
  grainSize: number;
  highlights: number;
  hsl: Hsl;
  lumaNoiseReduction: number;
  lutData?: string | null;
  lutIntensity?: number;
  lutName?: string | null;
  lutPath?: string | null;
  lutSize?: number;
  masks: Array<MaskContainer>;
  negativeBlueBalance: number;
  negativeGreenBalance: number;
  negativeRedBalance: number;
  orientationSteps: number;
  rating: number;
  rotation: number;
  saturation: number;
  sectionVisibility: SectionVisibility;
  shadows: number;
  sharpness: number;
  showClipping: boolean;
  structure: number;
  temperature: number;
  tint: number;
  toneMapper: 'agx' | 'basic';
  vibrance: number;
  vignetteAmount: number;
  vignetteFeather: number;
  vignetteMidpoint: number;
  vignetteRoundness: number;
  whites: number;
  // Low-Light Recovery
  hotPixelEnabled: boolean;
  hotPixelThreshold: number;
  hotPixelRadius: number;
  hotPixelMode: 'median' | 'interpolate' | 'clone';
  // Denoiser (ISO-adaptive)
  denoiseEnabled: boolean;
  denoiseAutoIso: boolean;
  denoiseStrength: number;
  denoiseDetail: number;
  denoiseChroma: number;
  denoiseIsoMultiplier: number;
  // PID Enhancement
  deblurEnabled: boolean;
  deblurType: 'motion' | 'focus' | 'gaussian';
  deblurLength: number;
  deblurAngle: number;
  deblurRadius: number;
  deblurStrength: number;
  deblurSmoothness: number;
  deblurNoiseDamp: number;
  deblurPreviewSize: number;
  deblurShowKernel: boolean;
  deblurShowAngleOverlay: boolean;
  deblurIterations: number;
  upscale2xEnabled: boolean;
}

export interface AiPatch {
  id: string;
  isLoading: boolean;
  name: string;
  patchData: any | null;
  prompt: string;
  subMasks: Array<SubMask>;
  visible: boolean;
}

export interface Color {
  color: string;
  name: string;
}

interface ColorGradingProps {
  [index: string]: number | HueSatLum;
  balance: number;
  blending: number;
  highlights: HueSatLum;
  midtones: HueSatLum;
  shadows: HueSatLum;
}

export interface Coord {
  x: number;
  y: number;
}

export interface Curves {
  [index: string]: Array<Coord>;
  blue: Array<Coord>;
  green: Array<Coord>;
  luma: Array<Coord>;
  red: Array<Coord>;
}

export interface HueSatLum {
  hue: number;
  saturation: number;
  luminance: number;
}

interface Hsl {
  [index: string]: HueSatLum;
  aquas: HueSatLum;
  blues: HueSatLum;
  greens: HueSatLum;
  magentas: HueSatLum;
  oranges: HueSatLum;
  purples: HueSatLum;
  reds: HueSatLum;
  yellows: HueSatLum;
}

export interface MaskAdjustments {
  [index: string]: any;
  blacks: number;
  brightness: number;
  clarity: number;
  colorGrading: ColorGradingProps;
  colorNoiseReduction: number;
  contrast: number;
  curves: Curves;
  dehaze: number;
  exposure: number;
  highlights: number;
  hsl: Hsl;
  id?: string;
  lumaNoiseReduction: number;
  saturation: number;
  sectionVisibility: SectionVisibility;
  shadows: number;
  sharpness: number;
  structure: number;
  temperature: number;
  tint: number;
  vibrance: number;
  whites: number;
  // PID Enhancement (mask-supported)
  deblurStrength: number;
  deblurSmoothness: number;
}

export interface MaskContainer {
  adjustments: MaskAdjustments;
  id?: any;
  invert: boolean;
  name: string;
  opacity: number;
  subMasks: Array<SubMask>;
  visible: boolean;
}

export interface Sections {
  [index: string]: Array<string>;
  basic: Array<string>;
  curves: Array<string>;
  color: Array<string>;
  details: Array<string>;
  effects: Array<string>;
  upscale: Array<string>;
  lowlight: Array<string>;
  blurrecovery: Array<string>;
}

export interface SectionVisibility {
  [index: string]: boolean;
  basic: boolean;
  curves: boolean;
  color: boolean;
  details: boolean;
  effects: boolean;
  upscale: boolean;
  lowlight: boolean;
  blurrecovery: boolean;
}

export const COLOR_LABELS: Array<Color> = [
  { name: 'red', color: '#ef4444' },
  { name: 'yellow', color: '#facc15' },
  { name: 'green', color: '#4ade80' },
  { name: 'blue', color: '#60a5fa' },
  { name: 'purple', color: '#a78bfa' },
];

const INITIAL_COLOR_GRADING: ColorGradingProps = {
  balance: 0,
  blending: 50,
  highlights: { hue: 0, saturation: 0, luminance: 0 },
  midtones: { hue: 0, saturation: 0, luminance: 0 },
  shadows: { hue: 0, saturation: 0, luminance: 0 },
};

const INITIAL_COLOR_CALIBRATION: ColorCalibration = {
  shadowsTint: 0,
  redHue: 0,
  redSaturation: 0,
  greenHue: 0,
  greenSaturation: 0,
  blueHue: 0,
  blueSaturation: 0,
};

export const INITIAL_MASK_ADJUSTMENTS: MaskAdjustments = {
  blacks: 0,
  brightness: 0,
  clarity: 0,
  colorGrading: { ...INITIAL_COLOR_GRADING },
  colorNoiseReduction: 0,
  contrast: 0,
  curves: {
    blue: [
      { x: 0, y: 0 },
      { x: 255, y: 255 },
    ],
    green: [
      { x: 0, y: 0 },
      { x: 255, y: 255 },
    ],
    luma: [
      { x: 0, y: 0 },
      { x: 255, y: 255 },
    ],
    red: [
      { x: 0, y: 0 },
      { x: 255, y: 255 },
    ],
  },
  dehaze: 0,
  exposure: 0,
  highlights: 0,
  hsl: {
    aquas: { hue: 0, saturation: 0, luminance: 0 },
    blues: { hue: 0, saturation: 0, luminance: 0 },
    greens: { hue: 0, saturation: 0, luminance: 0 },
    magentas: { hue: 0, saturation: 0, luminance: 0 },
    oranges: { hue: 0, saturation: 0, luminance: 0 },
    purples: { hue: 0, saturation: 0, luminance: 0 },
    reds: { hue: 0, saturation: 0, luminance: 0 },
    yellows: { hue: 0, saturation: 0, luminance: 0 },
  },
  lumaNoiseReduction: 0,
  saturation: 0,
  sectionVisibility: {
    basic: true,
    curves: true,
    color: true,
    details: true,
    effects: true,
    upscale: true,
    lowlight: true,
    blurrecovery: true,
  },
  shadows: 0,
  sharpness: 0,
  structure: 0,
  temperature: 0,
  tint: 0,
  vibrance: 0,
  whites: 0,
  // PID Enhancement (mask-supported)
  deblurStrength: 0,
  deblurSmoothness: 30,
};

export const INITIAL_MASK_CONTAINER: MaskContainer = {
  adjustments: INITIAL_MASK_ADJUSTMENTS,
  invert: false,
  name: 'New Mask',
  opacity: 100,
  subMasks: [],
  visible: true,
};

export const INITIAL_ADJUSTMENTS: Adjustments = {
  aiPatches: [],
  aspectRatio: null,
  blacks: 0,
  brightness: 0,
  centré: 0,
  clarity: 0,
  chromaticAberrationBlueYellow: 0,
  chromaticAberrationRedCyan: 0,
  colorCalibration: { ...INITIAL_COLOR_CALIBRATION },
  colorGrading: { ...INITIAL_COLOR_GRADING },
  colorNoiseReduction: 0,
  contrast: 0,
  crop: null,
  curves: {
    blue: [
      { x: 0, y: 0 },
      { x: 255, y: 255 },
    ],
    green: [
      { x: 0, y: 0 },
      { x: 255, y: 255 },
    ],
    luma: [
      { x: 0, y: 0 },
      { x: 255, y: 255 },
    ],
    red: [
      { x: 0, y: 0 },
      { x: 255, y: 255 },
    ],
  },
  dehaze: 0,
  enableNegativeConversion: false,
  exposure: 0,
  filmBaseColor: '#ff8800',
  flipHorizontal: false,
  flipVertical: false,
  grainAmount: 0,
  grainRoughness: 50,
  grainSize: 25,
  highlights: 0,
  hsl: {
    aquas: { hue: 0, saturation: 0, luminance: 0 },
    blues: { hue: 0, saturation: 0, luminance: 0 },
    greens: { hue: 0, saturation: 0, luminance: 0 },
    magentas: { hue: 0, saturation: 0, luminance: 0 },
    oranges: { hue: 0, saturation: 0, luminance: 0 },
    purples: { hue: 0, saturation: 0, luminance: 0 },
    reds: { hue: 0, saturation: 0, luminance: 0 },
    yellows: { hue: 0, saturation: 0, luminance: 0 },
  },
  lumaNoiseReduction: 0,
  lutData: null,
  lutIntensity: 100,
  lutName: null,
  lutPath: null,
  lutSize: 0,
  masks: [],
  negativeBlueBalance: 0,
  negativeGreenBalance: 0,
  negativeRedBalance: 0,
  orientationSteps: 0,
  rating: 0,
  rotation: 0,
  saturation: 0,
  sectionVisibility: {
    basic: true,
    curves: true,
    color: true,
    details: true,
    effects: true,
    upscale: true,
    lowlight: true,
    blurrecovery: true,
  },
  shadows: 0,
  sharpness: 0,
  showClipping: false,
  structure: 0,
  temperature: 0,
  tint: 0,
  toneMapper: 'basic',
  vibrance: 0,
  vignetteAmount: 0,
  vignetteFeather: 50,
  vignetteMidpoint: 50,
  vignetteRoundness: 0,
  whites: 0,
  // Low-Light Recovery
  hotPixelEnabled: false,
  hotPixelThreshold: 50,
  hotPixelRadius: 2,
  hotPixelMode: 'median',
  // Denoiser (ISO-adaptive)
  denoiseEnabled: false,
  denoiseAutoIso: true,
  denoiseStrength: 50,
  denoiseDetail: 50,
  denoiseChroma: 50,
  denoiseIsoMultiplier: 1.0,
  // PID Enhancement
  deblurEnabled: false,
  deblurType: 'motion',
  deblurLength: 50,
  deblurAngle: 0,
  deblurRadius: 25,
  deblurStrength: 50,
  deblurSmoothness: 30,
  deblurNoiseDamp: 50,
  deblurPreviewSize: 256,
  deblurShowKernel: false,
  deblurShowAngleOverlay: false,
  deblurIterations: 5,
  upscale2xEnabled: false,
};

export const normalizeLoadedAdjustments = (loadedAdjustments: Adjustments): any => {
  if (!loadedAdjustments) {
    return INITIAL_ADJUSTMENTS;
  }

  const normalizedMasks = (loadedAdjustments.masks || []).map((maskContainer: MaskContainer) => {
    const containerAdjustments = maskContainer.adjustments || {};
    const normalizedSubMasks = (maskContainer.subMasks || []).map((subMask: Partial<SubMask>) => ({
      visible: true,
      mode: SubMaskMode.Additive,
      ...subMask,
    }));

    return {
      ...INITIAL_MASK_CONTAINER,
      id: maskContainer.id || uuidv4(),
      ...maskContainer,
      adjustments: {
        ...INITIAL_MASK_ADJUSTMENTS,
        ...containerAdjustments,
        colorGrading: { ...INITIAL_MASK_ADJUSTMENTS.colorGrading, ...(containerAdjustments.colorGrading || {}) },
        hsl: { ...INITIAL_MASK_ADJUSTMENTS.hsl, ...(containerAdjustments.hsl || {}) },
        curves: { ...INITIAL_MASK_ADJUSTMENTS.curves, ...(containerAdjustments.curves || {}) },
        sectionVisibility: {
          ...INITIAL_MASK_ADJUSTMENTS.sectionVisibility,
          ...(containerAdjustments.sectionVisibility || {}),
        },
      },
      subMasks: normalizedSubMasks,
    };
  });

  const normalizedAiPatches = (loadedAdjustments.aiPatches || []).map((patch: any) => ({
    visible: true,
    ...patch,
  }));

  return {
    ...INITIAL_ADJUSTMENTS,
    ...loadedAdjustments,
    colorCalibration: { ...INITIAL_ADJUSTMENTS.colorCalibration, ...(loadedAdjustments.colorCalibration || {}) },
    colorGrading: { ...INITIAL_ADJUSTMENTS.colorGrading, ...(loadedAdjustments.colorGrading || {}) },
    hsl: { ...INITIAL_ADJUSTMENTS.hsl, ...(loadedAdjustments.hsl || {}) },
    curves: { ...INITIAL_ADJUSTMENTS.curves, ...(loadedAdjustments.curves || {}) },
    masks: normalizedMasks,
    aiPatches: normalizedAiPatches,
    sectionVisibility: {
      ...INITIAL_ADJUSTMENTS.sectionVisibility,
      ...(loadedAdjustments.sectionVisibility || {}),
    },
  };
};

export const COPYABLE_ADJUSTMENT_KEYS: Array<string> = [
  BasicAdjustment.Blacks,
  BasicAdjustment.Brightness,
  DetailsAdjustment.Clarity,
  DetailsAdjustment.Centré,
  DetailsAdjustment.ChromaticAberrationBlueYellow,
  DetailsAdjustment.ChromaticAberrationRedCyan,
  'colorCalibration',
  ColorAdjustment.ColorGrading,
  DetailsAdjustment.ColorNoiseReduction,
  BasicAdjustment.Contrast,
  'curves',
  DetailsAdjustment.Dehaze,
  Effect.EnableNegativeConversion,
  BasicAdjustment.Exposure,
  Effect.FilmBaseColor,
  Effect.GrainAmount,
  Effect.GrainRoughness,
  Effect.GrainSize,
  BasicAdjustment.Highlights,
  ColorAdjustment.Hsl,
  'lutIntensity',
  'lutName',
  'lutPath',
  'lutSize',
  DetailsAdjustment.LumaNoiseReduction,
  Effect.NegativeBlueBalance,
  Effect.NegativeGreenBalance,
  Effect.NegativeRedBalance,
  ColorAdjustment.Saturation,
  'sectionVisibility',
  BasicAdjustment.Shadows,
  DetailsAdjustment.Sharpness,
  'showClipping',
  DetailsAdjustment.Structure,
  ColorAdjustment.Temperature,
  ColorAdjustment.Tint,
  'toneMapper',
  ColorAdjustment.Vibrance,
  Effect.VignetteAmount,
  Effect.VignetteFeather,
  Effect.VignetteMidpoint,
  Effect.VignetteRoundness,
  BasicAdjustment.Whites,
  // Low-Light Recovery
  LowLightAdjustment.HotPixelEnabled,
  LowLightAdjustment.HotPixelThreshold,
  LowLightAdjustment.HotPixelRadius,
  LowLightAdjustment.HotPixelMode,
  LowLightAdjustment.DenoiseEnabled,
  LowLightAdjustment.DenoiseAutoIso,
  LowLightAdjustment.DenoiseStrength,
  LowLightAdjustment.DenoiseDetail,
  LowLightAdjustment.DenoiseChroma,
  // PID Enhancement
  BlurRecoveryAdjustment.DeblurEnabled,
  BlurRecoveryAdjustment.DeblurType,
  BlurRecoveryAdjustment.DeblurLength,
  BlurRecoveryAdjustment.DeblurAngle,
  BlurRecoveryAdjustment.DeblurRadius,
  BlurRecoveryAdjustment.DeblurStrength,
  BlurRecoveryAdjustment.DeblurSmoothness,
  BlurRecoveryAdjustment.DeblurNoiseDamp,
  BlurRecoveryAdjustment.DeblurPreviewSize,
  BlurRecoveryAdjustment.DeblurShowKernel,
];

export const ADJUSTMENT_SECTIONS: Sections = {
  basic: [
    BasicAdjustment.Brightness,
    BasicAdjustment.Contrast,
    BasicAdjustment.Highlights,
    BasicAdjustment.Shadows,
    BasicAdjustment.Whites,
    BasicAdjustment.Blacks,
    BasicAdjustment.Exposure,
    'toneMapper',
  ],
  curves: ['curves'],
  color: [
    ColorAdjustment.Saturation,
    ColorAdjustment.Temperature,
    ColorAdjustment.Tint,
    ColorAdjustment.Vibrance,
    ColorAdjustment.Hsl,
    ColorAdjustment.ColorGrading,
    'colorCalibration',
  ],
  details: [
    DetailsAdjustment.Clarity,
    DetailsAdjustment.Dehaze,
    DetailsAdjustment.Structure,
    DetailsAdjustment.Centré,
    DetailsAdjustment.Sharpness,
    DetailsAdjustment.LumaNoiseReduction,
    DetailsAdjustment.ColorNoiseReduction,
    DetailsAdjustment.ChromaticAberrationRedCyan,
    DetailsAdjustment.ChromaticAberrationBlueYellow,
  ],
  effects: [
    Effect.EnableNegativeConversion,
    Effect.FilmBaseColor,
    Effect.GrainAmount,
    Effect.GrainRoughness,
    Effect.GrainSize,
    Effect.LutIntensity,
    Effect.NegativeBlueBalance,
    Effect.NegativeGreenBalance,
    Effect.NegativeRedBalance,
    Effect.VignetteAmount,
    Effect.VignetteFeather,
    Effect.VignetteMidpoint,
    Effect.VignetteRoundness,
  ],
  upscale: [
    BlurRecoveryAdjustment.Upscale2xEnabled,
  ],
  lowlight: [
    LowLightAdjustment.HotPixelEnabled,
    LowLightAdjustment.HotPixelThreshold,
    LowLightAdjustment.HotPixelRadius,
    LowLightAdjustment.HotPixelMode,
    LowLightAdjustment.DenoiseEnabled,
    LowLightAdjustment.DenoiseAutoIso,
    LowLightAdjustment.DenoiseStrength,
    LowLightAdjustment.DenoiseDetail,
    LowLightAdjustment.DenoiseChroma,
  ],
  blurrecovery: [
    BlurRecoveryAdjustment.DeblurEnabled,
    BlurRecoveryAdjustment.DeblurType,
    BlurRecoveryAdjustment.DeblurLength,
    BlurRecoveryAdjustment.DeblurAngle,
    BlurRecoveryAdjustment.DeblurRadius,
    BlurRecoveryAdjustment.DeblurStrength,
    BlurRecoveryAdjustment.DeblurSmoothness,
    BlurRecoveryAdjustment.DeblurNoiseDamp,
    BlurRecoveryAdjustment.DeblurPreviewSize,
    BlurRecoveryAdjustment.DeblurShowKernel,
    BlurRecoveryAdjustment.DeblurIterations,
    // Note: DeblurShowAngleOverlay is frontend-only, not sent to backend
  ],
};