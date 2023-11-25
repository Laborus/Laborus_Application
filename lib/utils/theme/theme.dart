import 'package:flutter/material.dart';
import 'package:laborus_app/utils/theme/custom/appbar_theme.dart';
import 'package:laborus_app/utils/theme/custom/color_scheme_theme.dart';
import 'package:laborus_app/utils/theme/custom/elevated_button_theme.dart';
import 'package:laborus_app/utils/theme/custom/outlined_button_theme.dart';
import 'package:laborus_app/utils/theme/custom/text_theme.dart';

class LAppTheme {
  LAppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Inter',
    brightness: Brightness.light,
    appBarTheme: LAppBarTheme.lightAppBarTheme,
    colorScheme: LColorSchemeTheme.lightColorScheme,
    textTheme: LTextTheme.textTheme,
    elevatedButtonTheme: LElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: LOutlinedTheme.lightOutlinedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    appBarTheme: LAppBarTheme.darkAppBarTheme,
    colorScheme: LColorSchemeTheme.darkColorScheme,
    textTheme: LTextTheme.textTheme,
    elevatedButtonTheme: LElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: LOutlinedTheme.darkOutlinedButtonTheme,
  );
}
