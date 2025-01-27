
class LoginModel {
  final String userNameOrEmailAddress;
  final String password;
  final bool rememberClient;
  String? accessToken;

  LoginModel({
    required this.userNameOrEmailAddress,
    required this.password,
    this.rememberClient = true,
    this.accessToken,
  });

  Map<String, dynamic> toJson() => {
    'userNameOrEmailAddress': userNameOrEmailAddress,
    'password': password,
    'rememberClient': rememberClient,
  };
}