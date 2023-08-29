// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:laborus_app/pages/chat/view/chat.dart';

import 'package:laborus_app/pages/home/home.dart';
import 'package:laborus_app/pages/loading/load.dart';
import 'package:laborus_app/pages/notification/model/notification.dart';
import 'package:laborus_app/pages/notification/view/notification_view.dart';
import 'package:laborus_app/pages/profile/view/profile.dart';
import 'package:laborus_app/utils/routes.dart';
import 'package:laborus_app/utils/theme/dark_theme.dart';
import 'package:laborus_app/utils/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laborus',
      theme:  lightTheme,

      initialRoute: AppRoutes.start,
      routes: {
        AppRoutes.start:(ctx) => const Load(),
        AppRoutes.home: (ctx) => const Home(),
        AppRoutes.profile: (ctx) => const Profile(),
        AppRoutes.notification: (ctx) => const Notifications(),
        AppRoutes.messages: (ctx) => const Chat(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
