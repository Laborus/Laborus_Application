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
      id: json['_id']?.toString() ??
          '', // Ajustado para '_id' conforme a resposta da API
      name: json['name']?.toString() ?? '',
      courses: (json['courses'] as List<dynamic>?)
              ?.map((course) => course.toString())
              .toList() ??
          [],
    );
  }

  @override
  String toString() {
    return 'SchoolModel(id: $id, name: $name, courses: $courses)';
  }
}
