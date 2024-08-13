import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class LAppBarTheme {
  LAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.neutralsLight[0],
    foregroundColor: AppColors.neutralsLight[0],
  );
  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.neutralsDark[0],
    foregroundColor: AppColors.neutralsDark[0],
  );
}
