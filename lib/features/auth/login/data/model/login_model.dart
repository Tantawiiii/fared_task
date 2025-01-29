class LoginRequest {
  final String username;
  final String password;

  LoginRequest(this.username, this.password);

  Map<String, dynamic> toJson() {
    return {
      "userNameOrEmailAddress": username,
      "password": password,
      "rememberClient": true,
    };
  }
}
