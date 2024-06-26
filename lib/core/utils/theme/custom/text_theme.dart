import 'package:flutter/material.dart';

class LTextTheme {
  LTextTheme._();

  static TextTheme textTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 30,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
    ),
  );
}
