class SchoolModel {
  final String id;
  final String name;
  final List<String> courses;

  SchoolModel({
    required this.id,
    required this.name,
    required this.courses,
  });

  factory SchoolModel.fromJson(Map<String, dynamic> json) {
    return SchoolModel(
      id: json['_id'],
      name: json['name'],
      courses: List<String>.from(json['courses']),
    );
  }
}
