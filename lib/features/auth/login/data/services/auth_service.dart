import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/networking/api_constants.dart';
import '../model/login_model.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: tBaseAPIKey,
      headers: {
        'accept': 'text/plain',
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<String> login(LoginRequest request) async {
    final response = await _dio.post(tLoginAPIKey, data: request.toJson());

    if (response.statusCode == 200) {
      final token = response.data['result']['accessToken'];

      // Save the token to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', token);

      return token;
    } else {
      throw Exception(response.data['error']['message']);
    }
  }
}
