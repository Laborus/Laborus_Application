import 'package:laborus_app/pages/notification/model/notification.dart';

List<Notification> notification = const [
  Notification(
    name: 'Jose',
    image: 'assets/img/profile.jpg',
    typeOfNotification: TypeOfNotification.follow,
    onCheck: false,
  ),
  Notification(
    name: 'Maria',
    image: 'assets/img/profile.jpg',
    typeOfNotification: TypeOfNotification.groups,
    onCheck: false,
  ),
  Notification(
    name: 'João',
    image: 'assets/img/profile.jpg',
    typeOfNotification: TypeOfNotification.campus,
    onCheck: false,
  ),
  Notification(
    name: 'Pedro',
    image: 'assets/img/profile.jpg',
    typeOfNotification: TypeOfNotification.friends,
    onCheck: false,
  ),
];
