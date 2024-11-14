class SignupException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  SignupException(this.message, {this.code, this.details});

  @override
  String toString() => message;
}
