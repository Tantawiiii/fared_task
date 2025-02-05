import '../data/meeting_recording_model.dart';

abstract class MeetingRecordingState {}
class MeetingRecordingInitial extends MeetingRecordingState {}
class MeetingRecordingLoading extends MeetingRecordingState {}
class MeetingRecordingLoaded extends MeetingRecordingState {
  final MeetingRecording recording;
  MeetingRecordingLoaded(this.recording);
}
class MeetingRecordingError extends MeetingRecordingState {
  final String message;
  MeetingRecordingError(this.message);
}

