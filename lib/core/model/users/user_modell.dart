class UserModel {
  final String name;
  final String email;
  final String password;
  final String cpf;
  final String school;
  final String course;
  // final List<String> tags;
  final String? profileImage;
  final String? bannerImage;
  final String aboutContent;
  final String accountType;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.cpf,
    required this.school,
    required this.course,
    // required this.tags,
    this.profileImage,
    this.bannerImage,
    required this.aboutContent,
    this.accountType = 'Student',
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'cpf': cpf,
      'school': school,
      'course': course,
      // 'tags': ['TECNOLOGY'],
      'profileImage': profileImage,
      'bannerImage': bannerImage,
      // 'aboutContent': aboutContent,
      'accountType': accountType,
    };
  }
}
