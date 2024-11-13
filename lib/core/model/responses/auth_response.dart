class AuthResponse {
  final String status;
  final String message;
  final Map<String, dynamic> data;

  AuthResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: json['data'] ?? {},
    );
  }
}
