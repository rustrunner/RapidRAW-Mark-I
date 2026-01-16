use thiserror::Error;

/// Unified error type for RapidRAW processing operations.
/// Provides structured error handling with automatic String conversion for Tauri commands.
#[derive(Error, Debug)]
pub enum ProcessingError {
    #[error("Lock acquisition failed for {0}: {1}")]
    LockFailed(String, String),

    #[error("GPU operation failed: {0}")]
    GpuError(String),

    #[error("File operation failed: {0}")]
    FileError(#[from] std::io::Error),

    #[error("Image processing failed: {0}")]
    ImageError(String),

    #[error("Image decoding failed: {0}")]
    ImageDecodeError(#[from] image::ImageError),

    #[error("Panorama stitching failed: {0}")]
    PanoramaError(String),

    #[error("AI processing failed: {0}")]
    AiError(String),

    #[error("JSON serialization failed: {0}")]
    SerializationError(#[from] serde_json::Error),

    #[error("Invalid input: {0}")]
    InvalidInput(String),

    #[error("Resource not found: {0}")]
    NotFound(String),

    #[error("Operation cancelled")]
    Cancelled,

    #[error("{0}")]
    Other(String),
}

/// Enables automatic conversion to String for Tauri command return types.
/// Tauri commands that return Result<T, String> can use ProcessingError directly.
impl From<ProcessingError> for String {
    fn from(err: ProcessingError) -> Self {
        err.to_string()
    }
}

/// Helper macro to safely acquire a mutex lock, returning ProcessingError on failure.
///
/// # Usage
/// ```
/// let cache = lock_or_err!(state.lut_cache, "LUT cache")?;
/// ```
#[macro_export]
macro_rules! lock_or_err {
    ($mutex:expr, $name:expr) => {
        $mutex.lock().map_err(|e| {
            $crate::errors::ProcessingError::LockFailed($name.to_string(), e.to_string())
        })
    };
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_error_to_string() {
        let err = ProcessingError::LockFailed("test".to_string(), "poisoned".to_string());
        assert_eq!(err.to_string(), "Lock acquisition failed for test: poisoned");
    }

    #[test]
    fn test_error_into_string() {
        let err = ProcessingError::GpuError("buffer creation failed".to_string());
        let s: String = err.into();
        assert_eq!(s, "GPU operation failed: buffer creation failed");
    }
}
