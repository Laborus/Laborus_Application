import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(30, 30, 30, 1),
    foregroundColor: Color.fromRGBO(255, 255, 255, 1),
  ),
  colorScheme: const ColorScheme.dark(
    background: Color.fromRGBO(36, 36, 36, 1),
    primary: Color.fromRGBO(128, 0, 173, 1),
    secondary: Color.fromRGBO(157, 53, 242, 1),
    tertiary: Color.fromRGBO(76, 17, 117, 1),
    error: Color.fromRGBO(255,242,249,1),
    onError: Color.fromRGBO(255,100,124,1)
  ),
);