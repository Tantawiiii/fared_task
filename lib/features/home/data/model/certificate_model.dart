class Certificate {
  final int id;
  final int userId;
  final String name;
  final String nameEN;
  final DateTime issueDate;
  final String issueOrganizationName;
  final String issueOrganizationNameEN;
  final String issueOrganizationImageUrl;
  final String imageUrl;

  Certificate({
    required this.id,
    required this.userId,
    required this.name,
    required this.nameEN,
    required this.issueDate,
    required this.issueOrganizationName,
    required this.issueOrganizationNameEN,
    required this.issueOrganizationImageUrl,
    required this.imageUrl,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      name: json['name'] ?? '',
      nameEN: json['nameEN'] ?? '',
      issueDate: DateTime.parse(json['issueDate']),
      issueOrganizationName: json['issueOrganizationName'] ?? '',
      issueOrganizationNameEN: json['issueOrganizationNameEN'] ?? '',
      issueOrganizationImageUrl: json['issueOrganizationImageUrl'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
