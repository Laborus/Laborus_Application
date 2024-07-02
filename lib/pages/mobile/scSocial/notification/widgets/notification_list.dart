import 'package:flutter/material.dart';
import 'package:laborus_app/pages/mobile/scSocial/notification/data/data.dart';
import 'package:laborus_app/core/model/notification/notification.dart';
import 'package:laborus_app/pages/mobile/scSocial/notification/widgets/notification_item.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({super.key});
  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (notification[index].typeOfNotification ==
              TypeOfNotification.friends) {
            return NotificationFriend(
              name: notification[index].name,
              image: notification[index].image,
            );
          }
          return NotificationDefault(
              name: notification[index].name,
              image: notification[index].image,
              notificationMessage: 'postou uma nova publicação');
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: notification.length);
  }
}
