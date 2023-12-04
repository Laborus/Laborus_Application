import 'package:flutter/material.dart';
import 'package:laborus_app/utils/constants/colors.dart';

class LBottomSheetTheme {
  LBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: AppColors.neutralsLight[0],
  );
  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: AppColors.neutralsDark[0],
  );
}
