import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/meeting_recording_service.dart';
import 'meeting_recording_state.dart';


class MeetingRecordingCubit extends Cubit<MeetingRecordingState> {
  final MeetingRecordingService _service;

  MeetingRecordingCubit(this._service) : super(MeetingRecordingInitial());

  void fetchMeetingRecording(int sessionId) async {
    emit(MeetingRecordingLoading());
    try {
      final recording = await _service.getMeetingRecording(sessionId);
      emit(MeetingRecordingLoaded(recording));
    } catch (e) {
      print("Error fetching recording: $e");
      emit(MeetingRecordingError('Failed to load recording: $e'));
    }
  }

}
