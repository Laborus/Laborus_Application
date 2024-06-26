import 'package:flutter/material.dart';

class LColorSchemeTheme {
  LColorSchemeTheme._();

  static ColorScheme lightColorScheme = const ColorScheme.light(
    primary: Color.fromRGBO(128, 0, 173, 1),
    secondary: Color.fromRGBO(157, 53, 242, 1),
    tertiary: Color.fromRGBO(76, 17, 117, 1),
    error: Color.fromRGBO(255, 242, 249, 1),
    onError: Color.fromRGBO(255, 100, 124, 1),
    surface: Color.fromRGBO(242, 245, 249, 1),
  );
  static ColorScheme darkColorScheme = const ColorScheme.dark(
    primary: Color.fromRGBO(128, 0, 173, 1),
    secondary: Color.fromRGBO(157, 53, 242, 1),
    tertiary: Color.fromRGBO(76, 17, 117, 1),
    error: Color.fromRGBO(255, 242, 249, 1),
    onError: Color.fromRGBO(255, 100, 124, 1),
    surface: Color.fromRGBO(36, 36, 36, 1),
  );
}
