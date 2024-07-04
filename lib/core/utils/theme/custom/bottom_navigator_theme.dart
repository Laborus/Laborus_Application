import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class LBottomNavigatorTheme {
  LBottomNavigatorTheme._();

  static BottomAppBarTheme lightBottomAppBarTheme = BottomAppBarTheme(
    color: AppColors.neutralsLight[0],
    elevation: 0,
  );

  static BottomAppBarTheme darkBottomAppBarTheme = BottomAppBarTheme(
    color: AppColors.neutralsDark[0],
    elevation: 0,
  );
}
