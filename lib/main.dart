// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:laborus_app/pages/home/home.dart';
import 'package:laborus_app/utils/database.dart';
import 'package:laborus_app/utils/theme/dark_theme.dart';
import 'package:laborus_app/utils/theme/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laborus',
      theme:  darkTheme,
      home: const Home(),
    );
  }
}
