import 'package:dio/dio.dart';
import 'package:fared_task/core/local_data/shared_preferance.dart';
import '../../../../core/local_data/user_id_local.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/session_model.dart';

class SessionService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: tBaseAPIKey,
      headers: {
        'accept': 'text/plain',
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<List<Session>> fetchSessions() async {
    try {
      final parentId = await getParentId();
      if (parentId == null) {
        throw Exception("Parent ID not found");
      }
      print("Fetching Parent id: $parentId" );
      final token = await getAccessToken();
      if (token == null) {
        throw Exception("Access token not found");
      }

      final options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.get("$tSessionKey?parentId=$parentId", options: options);

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData is Map<String, dynamic> && responseData.containsKey('result')) {
          final sessionList = responseData['result'];

          if (sessionList is List) {
            return sessionList.map((json) => Session.fromJson(json)).toList();
          } else {
            throw Exception("Expected a list in 'result', but got ${sessionList.runtimeType}");
          }
        } else {
          throw Exception("Unexpected API response format");
        }
      } else {
        throw Exception('Failed to load sessions');
      }
    } catch (e) {
      throw Exception('Error fetching sessions: $e');
    }
  }

}
