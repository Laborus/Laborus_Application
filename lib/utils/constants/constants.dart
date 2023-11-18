import 'package:flutter/material.dart';

TextTheme font([Color? color,FontWeight? weight]) {
  return TextTheme(
  headlineLarge: TextStyle(fontSize:30, fontWeight: weight, color: color),
  headlineMedium: TextStyle(fontSize: 24, fontWeight: weight, color: color),
  headlineSmall: TextStyle(fontSize: 20, fontWeight: weight, color: color),
  titleMedium: TextStyle(fontSize: 18, fontWeight: weight, color: color),
  titleSmall: TextStyle(fontSize: 16, fontWeight: weight, color: color),
  bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Roboto', fontWeight: weight, color: color),
  bodySmall: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: weight),
);
}
