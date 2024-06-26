import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/constants/colors.dart';

class LDividerTheme {
  LDividerTheme._();

  static DividerThemeData lightDivider =
      DividerThemeData(color: AppColors.neutralsLight[300], space: .8);
  static DividerThemeData darkDivider =
      DividerThemeData(color: AppColors.neutralsDark[300], space: .8);
}
