class ValidationException implements Exception {
  final String message;
  final FieldErrors errors;

  ValidationException({required this.message, required this.errors});

  @override
  String toString() => 'ValidationException: $message';
}

class FieldErrors {
  final Map<String, List<String>> _errors;

  FieldErrors([Map<String, List<String>>? errors]) : _errors = errors ?? {};

  // Access raw map
  Map<String, List<String>> get all => _errors;

  // Get errors for a specific field
  List<String> forField(String field) => _errors[field] ?? [];

  // Get first error for a specific field
  String? first(String field) => _errors[field]?.first;

  // Flatten all error messages
  List<String> flatten() => _errors.values.expand((e) => e).toList();

  // Whether any errors exist
  bool get hasAny => _errors.isNotEmpty;

  // Whether a specific field has an error
  bool has(String field) => _errors.containsKey(field);

  // Clear all errors
  void clear() {
    _errors.clear();
  }

  // Create from raw JSON
  factory FieldErrors.fromJson(Map<String, dynamic> json) {
    return FieldErrors(
      json.map((key, value) => MapEntry(key, List<String>.from(value))),
    );
  }
}
