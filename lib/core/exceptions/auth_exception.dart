class AuthException implements Exception {
  final String message;
  final String? code;

  AuthException(this.message, [this.code]);

  @override
  String toString() =>
      'AuthException: $message${code != null ? ' (Code: $code)' : ''}';
}
