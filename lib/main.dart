import 'package:flutter/material.dart';
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
    return MaterialApp.router(
      title: 'Laborus',
      theme: lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
