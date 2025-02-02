class AuthResponse {
  final String accessToken;
  final String encryptedAccessToken;
  final int expireInSeconds;
  final int userId;

  AuthResponse({
    required this.accessToken,
    required this.encryptedAccessToken,
    required this.expireInSeconds,
    required this.userId,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json["accessToken"],
      encryptedAccessToken: json["encryptedAccessToken"],
      expireInSeconds: json["expireInSeconds"],
      userId: json["userId"],
    );
  }
}
