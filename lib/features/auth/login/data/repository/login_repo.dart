

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../../../local_data/shared_preferance.dart';
import '../model/login_model.dart';


class AuthRepository {
  final Dio _dio = Dio();
 v
  Future<Map<String, dynamic>> login(String userNameOrEmailAddress, String password) async {
    try {
      final authModel = LoginModel(
        userNameOrEmailAddress: userNameOrEmailAddress,
        password: password,
      );

      final response = await _dio.post(
        tLoginAPIKey,
        data: authModel.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200 && response.data['accessToken'] != null) {
        await saveToken(response.data['accessToken']);
        return {'success': true};
      } else {
        return {
          'success': false,
          'error': response.data['error']?['details'] ?? 'Unexpected error',
        };
      }
    } catch (e) {
      if (e is DioException && e.response != null) {
        return {
          'success': false,
          'error': e.response!.data['error']?['details'] ?? 'An error occurred',
        };
      } else {
        return {'success': false, 'error': 'An unexpected error occurred'};
      }
    }
  }
}
