import 'package:flutter/material.dart';

class FriendRequestButton extends StatelessWidget {
  const FriendRequestButton(
      {super.key, required this.label, required this.color});
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 13),
        child: Text(
          label,
          style: const TextTheme().bodyMedium,
        ),
      ),
    );
  }
}

class NotificationFriend extends StatelessWidget {
  const NotificationFriend(
      {super.key, required this.name, required this.image});
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          notificationInfo(context, image, name),
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(
                width: 60,
              ),
              FriendRequestButton(
                label: 'Aceitar',
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 9),
              FriendRequestButton(
                label: 'Rejeitar',
                color: Theme.of(context).colorScheme.onError,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NotificationDefault extends StatelessWidget {
  const NotificationDefault(
      {super.key,
      required this.name,
      required this.image,
      required this.notificationMessage});
  final String name;
  final String image;
  final String notificationMessage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          notificationInfo(context, image, name, notificationMessage),
        ],
      ),
    );
  }
}

Row notificationInfo(BuildContext context, image, name, [notificationMessage]) {
  return Row(
    children: [
      Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 25,
          ),
          Positioned(
            top: -2,
            left: -4,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).canvasColor),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          )
        ],
      ),
      const SizedBox(width: 13),
      Expanded(
        child: textRich(context, name, notificationMessage),
      )
    ],
  );
}

Text textRich(BuildContext context, String name, [String? text]) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(text: '$name ', style: const TextTheme().titleSmall),
        TextSpan(
          text: text ?? 'enviou um pedido de conexão',
          style: const TextTheme().titleSmall,
        ),
      ],
    ),
  );
}
