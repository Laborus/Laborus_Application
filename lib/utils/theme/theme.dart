import 'package:flutter/material.dart';
import 'package:laborus_app/utils/theme/custom/appbar_theme.dart';
import 'package:laborus_app/utils/theme/custom/color_scheme_theme.dart';
import 'package:laborus_app/utils/theme/custom/text_theme.dart';

class LAppTheme {
  LAppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Inter',
    brightness: Brightness.light,
    canvasColor: const Color.fromRGBO(250, 250, 252, 1),
    appBarTheme: LAppBarTheme.lightAppBarTheme,
    colorScheme: LColorSchemeTheme.lightColorScheme,
    textTheme: LTextTheme.textTheme,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    canvasColor: const Color.fromRGBO(47, 47, 47, 1),
    appBarTheme: LAppBarTheme.darkAppBarTheme,
    colorScheme: LColorSchemeTheme.darkColorScheme,
    textTheme: LTextTheme.textTheme,
  );
}
