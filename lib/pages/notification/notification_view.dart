import 'package:flutter/material.dart';
import 'package:laborus_app/pages/notification/widgets/notification_list.dart';
import 'package:laborus_app/utils/constants/constants.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Notificações',
            style: font(Theme.of(context).appBarTheme.foregroundColor,
                    FontWeight.w700)
                .headlineSmall,
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
                child: Text(
                  'Marcar como lido',
                  style: font(Colors.white, FontWeight.w500).bodyMedium,
                ),
              ),
            ),
          )
        ]),
        bottom: AppBar(
          toolbarHeight: 40,
          leadingWidth: width * 1,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(context, true),
                button(context, false),
                button(context, false),
                button(context, false),
              ],
            ),
          ),
          elevation: 0,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(21),
        child: NotificationList(),
      ),
    );
  }
}

Widget button(ctx, bool active) {
  return Expanded(
    flex: 2,
    child: InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: active
                  ? Theme.of(ctx).colorScheme.primary
                  : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 11, left: 5),
          child: Text(
            'Todas',
            style:
                font(Theme.of(ctx).appBarTheme.foregroundColor, FontWeight.w600)
                    .titleSmall,
          ),
        ),
      ),
    ),
  );
}
