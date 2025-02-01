class Student {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String imageUrl;
  final int parentId;

  Student({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.imageUrl,
    required this.parentId,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      parentId: json['parentId'] ?? 0,
    );
  }
}
