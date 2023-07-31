import 'package:flutter/material.dart';
import 'package:laborus_app/pages/loading/load.dart';
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
      theme:  darkTheme,
      home: const Load(),
      debugShowCheckedModeBanner: false,
    );
  }
}
