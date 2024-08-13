import 'package:laborus_app/core/model/social/people.dart';

class Group {
  const Group({required this.name, required this.image, required this.members});
  final String name;
  final String image;
  final List<People> members;
}
