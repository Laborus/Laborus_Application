import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class LColorSchemeTheme {
  LColorSchemeTheme._();

  static ColorScheme lightColorScheme = ColorScheme.light(
      primary: AppColors.neutralsLight[0]!,
      primaryContainer: AppColors.neutralsLight[100]!,
      onPrimary: AppColors.neutralsLight[200]!,
      secondary: AppColors.neutralsLight[300]!,
      secondaryContainer: AppColors.neutralsLight[400]!,
      onSecondary: AppColors.neutralsLight[500]!,
      tertiary: AppColors.neutralsLight[600]!,
      tertiaryContainer: AppColors.neutralsLight[700]!,
      onTertiary: AppColors.neutralsLight[800]!);
  static ColorScheme darkColorScheme = ColorScheme.dark(
      primary: AppColors.neutralsDark[0]!,
      primaryContainer: AppColors.neutralsDark[100]!,
      onPrimary: AppColors.neutralsDark[200]!,
      secondary: AppColors.neutralsDark[300]!,
      secondaryContainer: AppColors.neutralsDark[400]!,
      onSecondary: AppColors.neutralsDark[500]!,
      tertiary: AppColors.neutralsDark[600]!,
      tertiaryContainer: AppColors.neutralsDark[700]!,
      onTertiary: AppColors.neutralsDark[800]!);
}
