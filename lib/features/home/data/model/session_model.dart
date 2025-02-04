import 'student_model.dart';
import 'teacher_model.dart';

class Session {
  final int id;
  final String title;
  final String titleEn;
  final String image;
  final String description;
  final String shortDescription;
  final String shortDescriptionEn;
  final DateTime date;
  final bool isReported;
  final int reportId;
  final int number;
  final int appointmentStatus;
  final int sessionId;
  final List<int> timeSlotId;
  final List<Student> students;
  final Teacher teacher;

  Session({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.image,
    required this.description,
    required this.shortDescription,
    required this.shortDescriptionEn,
    required this.date,
    required this.isReported,
    required this.reportId,
    required this.number,
    required this.appointmentStatus,
    required this.sessionId,
    required this.timeSlotId,
    required this.students,
    required this.teacher,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      titleEn: json['titleEn'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      shortDescription: json['shortDescription'] ?? '',
      shortDescriptionEn: json['shortDescriptionEn'] ?? '',
      date: json['date'] != null ? DateTime.tryParse(json['date']) ?? DateTime.now() : DateTime.now(),
      isReported: json['isReported'] ?? false,
      reportId: json['reportId'] ?? 0,
      number: json['number'] ?? 0,
      appointmentStatus: json['appointmentStatus'] ?? 0,
      sessionId: json['sessionId'] ?? 0,
      timeSlotId: (json['timeSlotId'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [],
      students: (json['students'] as List<dynamic>?)
          ?.map((student) => Student.fromJson(student))
          .toList() ?? [],
      teacher: Teacher.fromJson(json['teacher'] ?? {}),
    );
  }
}
