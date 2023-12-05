import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/pages/notification/widgets/notification_list.dart';
import 'package:laborus_app/utils/routes/global_routes.dart';

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GlobalRouteStack.pop();
            String previousRoute = GlobalRouteStack.getPreviousRoute();

            context.goNamed(previousRoute);
          },
        ),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Notificações',
            style: Theme.of(context).textTheme.headlineSmall,
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
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                    color: Colors.white,
                  ),
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
            style: Theme.of(ctx).textTheme.titleSmall,
          ),
        ),
      ),
    ),
  );
}
