import 'package:dio/dio.dart';

import '../../../../../core/local_data/shared_preferance.dart';
import '../../../../../core/local_data/user_id_local.dart';
import '../../../../../core/networking/api_constants.dart';
import '../model/login_model.dart';
import 'login_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio dio;

  AuthRepositoryImpl(this.dio);

  @override
  Future<AuthResponse> authenticate(String email, String password) async {
    try {
      final response = await dio.post(
        tBaseAPIKey + tLoginAPIKey,
        data: {
          "userNameOrEmailAddress": email,
          "password": password,
          "rememberClient": true
        },
        options: Options(
          headers: {
            "accept": "text/plain",
            "Content-Type": "application/json",
          },
        ),
      );
    // print("Response: ${response.data}");

      if (response.statusCode == 200) {
        final authResponse = AuthResponse.fromJson(response.data['result']);

        await saveToken(authResponse.accessToken);
        await saveParentId(authResponse.userId);
        print(authResponse.userId);

        return authResponse;
      } else {
        throw Exception("Authentication failed");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
