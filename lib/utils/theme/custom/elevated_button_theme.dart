import 'package:flutter/material.dart';
import 'package:laborus_app/utils/constants/colors.dart';

class LElevatedButtonTheme {
  LElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.neutralsLight[700] as Color;
          }
          return AppColors.darknessPurple;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          return AppColors.neutralsDark[800] as Color;
        },
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: MaterialStateProperty.all<double>(1),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 22),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.neutralsDark[300] as Color;
          }
          return AppColors.darknessPurple;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          return AppColors.neutralsDark[800] as Color;
        },
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: MaterialStateProperty.all<double>(8),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 22),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
