import 'package:flutter/material.dart';

class LBottomNavigatorTheme {
  LBottomNavigatorTheme._();

  static BottomAppBarTheme lightBottomAppBarTheme = BottomAppBarTheme(
    color: Colors.blue,
    elevation: 4.0,
    shape: CircularNotchedRectangle(),
  );

  static BottomAppBarTheme darkBottomAppBarTheme = BottomAppBarTheme(
    color: Colors.grey[800],
    elevation: 4.0,
    shape: CircularNotchedRectangle(),
  );
}
