import 'package:dio/dio.dart';

import '../../../core/networking/api_constants.dart';
import 'meeting_recording_model.dart';

class MeetingRecordingService {
  final Dio _dio = Dio();

  Future<MeetingRecording> getMeetingRecording(int sessionId) async {
    print("sessionId: ${sessionId}");


    final response = await _dio.get(tGetMeeting,
        queryParameters: {'Id': sessionId});
    print("sessionId: ${sessionId}");
    return MeetingRecording.fromJson(response.data);
  }
}