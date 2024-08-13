import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class LScrollBarTheme {
  LScrollBarTheme._();

  static ScrollbarThemeData lightScrollbarTheme = const ScrollbarThemeData(
    radius: Radius.circular(999),
    thickness: WidgetStatePropertyAll(4),
    mainAxisMargin: 5,
    interactive: true,
    thumbColor: WidgetStatePropertyAll(AppColors.darknessPurple),
  );
  static ScrollbarThemeData darkScrollbarTheme = const ScrollbarThemeData(
    radius: Radius.circular(999),
    thickness: WidgetStatePropertyAll(4),
    mainAxisMargin: 5,
    interactive: true,
    thumbColor: WidgetStatePropertyAll(AppColors.darknessPurple),
  );
}
