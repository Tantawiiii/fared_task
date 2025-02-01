
import 'certificate_model.dart';
import 'experience_model.dart';

class Teacher {
  final int id;
  final String name;
  final String nameEN;
  final String rate;
  final String imageUrl;
  final String bio;
  final String bioEN;
  final String jobTitle;
  final String jobTitleEN;
  final List<Experience> expDtos;
  final List<Certificate> certificateDos;

  Teacher({
    required this.id,
    required this.name,
    required this.nameEN,
    required this.rate,
    required this.imageUrl,
    required this.bio,
    required this.bioEN,
    required this.jobTitle,
    required this.jobTitleEN,
    required this.expDtos,
    required this.certificateDos,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      nameEN: json['nameEN'] ?? '',
      rate: json['rate'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      bio: json['bio'] ?? '',
      bioEN: json['bioEN'] ?? '',
      jobTitle: json['jobTitle'] ?? '',
      jobTitleEN: json['jobTitleEN'] ?? '',
      expDtos: (json['expDtos'] as List<dynamic>?)
          ?.map((exp) => Experience.fromJson(exp))
          .toList() ??
          [],
      certificateDos: (json['certificateDos'] as List<dynamic>?)
          ?.map((cert) => Certificate.fromJson(cert))
          .toList() ??
          [],
    );
  }
}
