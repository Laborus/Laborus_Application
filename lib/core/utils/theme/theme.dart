import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/custom/appbar_theme.dart';
import 'package:laborus_app/core/utils/theme/custom/bottom_sheet_theme.dart';
import 'package:laborus_app/core/utils/theme/custom/color_scheme_theme.dart';
import 'package:laborus_app/core/utils/theme/custom/divider_theme.dart';
import 'package:laborus_app/core/utils/theme/custom/elevated_button_theme.dart';
import 'package:laborus_app/core/utils/theme/custom/outlined_button_theme.dart';
import 'package:laborus_app/core/utils/theme/custom/text_field_theme.dart';
import 'package:laborus_app/core/utils/theme/custom/text_theme.dart';

class LAppTheme {
  LAppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Inter',
    brightness: Brightness.light,
    appBarTheme: LAppBarTheme.lightAppBarTheme,
    colorScheme: LColorSchemeTheme.lightColorScheme,
    textTheme: LTextTheme.textTheme,
    inputDecorationTheme: LTextFieldTheme.lightTextFieldTheme,
    elevatedButtonTheme: LElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: LOutlinedTheme.lightOutlinedButtonTheme,
    dividerTheme: LDividerTheme.lightDivider,
    bottomSheetTheme: LBottomSheetTheme.lightBottomSheetTheme,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    appBarTheme: LAppBarTheme.darkAppBarTheme,
    colorScheme: LColorSchemeTheme.darkColorScheme,
    textTheme: LTextTheme.textTheme,
    inputDecorationTheme: LTextFieldTheme.darkTextFieldTheme,
    elevatedButtonTheme: LElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: LOutlinedTheme.darkOutlinedButtonTheme,
    dividerTheme: LDividerTheme.darkDivider,
    bottomSheetTheme: LBottomSheetTheme.darkBottomSheetTheme,
  );
}
