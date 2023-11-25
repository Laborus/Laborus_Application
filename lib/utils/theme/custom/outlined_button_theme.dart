import 'package:flutter/material.dart';
import 'package:laborus_app/utils/constants/colors.dart';

class LOutlinedTheme {
  LOutlinedTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.neutralsLight[0] as Color;
          }
          return AppColors.neutralsLight[0] as Color;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.transparent;
          }
          return Colors.transparent;
        },
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
      ),
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (Set<MaterialState> states) {
          return BorderSide(
            color: AppColors.neutralsLight[0] as Color,
            width: 1.0,
          );
        },
      ),
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

  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.neutralsDark[800] as Color;
          }
          return AppColors.neutralsDark[800] as Color;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.transparent;
          }
          return Colors.transparent;
        },
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
      ),
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (Set<MaterialState> states) {
          return BorderSide(
            color: AppColors.neutralsDark[800] as Color,
            width: 1.0,
          );
        },
      ),
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
