/**
 * Safely parse JSON with error handling.
 * Use this for external/untrusted data that could be malformed.
 *
 * @param json - The JSON string to parse
 * @param fallback - Value to return if parsing fails
 * @param onError - Optional callback for error handling/logging
 * @returns Parsed value or fallback on error
 */
export function safeJsonParse<T>(
  json: string,
  fallback: T,
  onError?: (error: Error) => void
): T {
  try {
    return JSON.parse(json) as T;
  } catch (error) {
    if (onError && error instanceof Error) {
      onError(error);
    }
    console.error('JSON parse error:', error);
    return fallback;
  }
}
