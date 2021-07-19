class AuthResult {
  String token;
  String? error;

  AuthResult({required this.token, required this.error});

  factory AuthResult.fromJson(Map<String, dynamic> json) {
    return AuthResult(
      token: json['token'],
      error: null,
    );
  }
}
