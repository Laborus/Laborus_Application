enum TypeOfNotification{
  follow,
  groups,
  campus,
  friends,
}

class Notification {
  final String name;
  final String image;
  final TypeOfNotification typeOfNotification;
  final bool onCheck;
  const Notification({required this.name, required this.image, required this.typeOfNotification, required this.onCheck});
}
