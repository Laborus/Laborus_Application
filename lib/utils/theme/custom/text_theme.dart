import 'package:flutter/material.dart';

class LTextTheme {
  LTextTheme._();

  static TextTheme textTheme = TextTheme(
    headlineLarge: _createTextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: _createTextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: _createTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: _createTextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: _createTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: _createTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
    ),
    bodySmall: _createTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
    ),
  );

  static TextStyle _createTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 12,
      fontFamily: fontFamily ?? 'Inter',
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
}
