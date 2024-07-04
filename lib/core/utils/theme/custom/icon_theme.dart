import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class LIconTheme {
  LIconTheme._();

  static IconThemeData lightIconTheme = IconThemeData(
    color: AppColors.neutralsLight[800],
  );
  static IconThemeData darkIconTheme = IconThemeData(
    color: AppColors.neutralsDark[800],
  );
}
