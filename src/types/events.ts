/**
 * Type definitions for Tauri event payloads.
 * These types define the shape of data received from backend events.
 */

// Preview and image update events
export interface PreviewUpdatePayload {
  base64: string;
}

export interface HistogramUpdatePayload {
  histogram: number[][];
}

export interface WaveformUpdatePayload {
  waveform: string; // base64 encoded image
}

export interface ThumbnailGeneratedPayload {
  path: string;
  data: string; // base64 encoded thumbnail
  rating: number;
}

// Progress events
export interface ThumbnailProgressPayload {
  completed: number;
  total: number;
}

export interface PanoramaProgressPayload {
  stage: string;
  progress: number;
}

export interface PanoramaCompletePayload {
  base64: string;
}

export interface PanoramaErrorPayload {
  error: string;
}

export interface BatchExportProgressPayload {
  current: number;
  total: number;
  currentFile: string;
}

export interface ImportProgressPayload {
  current: number;
  total: number;
  currentFile: string;
}

export interface ImportStartPayload {
  total: number;
}

export interface DenoiseProgressPayload {
  stage: string;
  progress: number;
}

export interface DenoiseCompletePayload {
  base64: string;
}

export interface DenoiseErrorPayload {
  error: string;
}

export interface IndexingProgressPayload {
  indexed: number;
  total: number;
}

// AI events
export interface AiModelDownloadPayload {
  modelName: string;
  progress?: number;
}

export interface ComfyUiStatusPayload {
  status: 'connected' | 'disconnected' | 'error';
  message?: string;
}

// Culling events
export interface CullingProgressPayload {
  current: number;
  total: number;
  stage: string;
}

// File events
export interface OpenWithFilePayload {
  path: string;
}

// Generic event wrapper type for Tauri listen()
export interface TauriEvent<T> {
  event: string;
  windowLabel: string;
  payload: T;
  id: number;
}
