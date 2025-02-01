class Experience {
  final int id;
  final int userId;
  final String jobTitle;
  final String jobTitleEN;
  final String companyName;
  final String companyNameEN;
  final String companyImageUrl;
  final bool isPresent;
  final DateTime startDate;
  final DateTime endDate;

  Experience({
    required this.id,
    required this.userId,
    required this.jobTitle,
    required this.jobTitleEN,
    required this.companyName,
    required this.companyNameEN,
    required this.companyImageUrl,
    required this.isPresent,
    required this.startDate,
    required this.endDate,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      jobTitle: json['jobTitle'] ?? '',
      jobTitleEN: json['jobTitleEN'] ?? '',
      companyName: json['companyName'] ?? '',
      companyNameEN: json['companyNameEN'] ?? '',
      companyImageUrl: json['companyImageUrl'] ?? '',
      isPresent: json['isPresent'] ?? false,
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }
}
