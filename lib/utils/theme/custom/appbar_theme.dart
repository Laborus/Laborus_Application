import 'package:flutter/material.dart';

class LAppBarTheme {
  LAppBarTheme._();

  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
    foregroundColor: Color.fromRGBO(30, 30, 30, 1),
  );
  static AppBarTheme darkAppBarTheme = const AppBarTheme(
    backgroundColor: Color.fromRGBO(30, 30, 30, 1),
    foregroundColor: Color.fromRGBO(255, 255, 255, 1),
  );
}
