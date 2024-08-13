import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class LChipTheme {
  LChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(999),
    ),
    side: BorderSide.none,
    elevation: 0,
    labelStyle: TextStyle(
      color: AppColors.neutralsLight[0],
      fontSize: AppFontSize.small,
      fontWeight: FontWeight.w800,
    ),
    labelPadding: const EdgeInsets.only(left: 3, right: 2),
    padding: const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 5,
    ),
  );
  static ChipThemeData darkChipTheme = ChipThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(999),
    ),
    side: BorderSide.none,
    elevation: 0,
    labelStyle: TextStyle(
      color: AppColors.neutralsLight[0],
      fontSize: AppFontSize.small,
      fontWeight: FontWeight.w800,
    ),
    labelPadding: const EdgeInsets.only(left: 3, right: 2),
    padding: const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 5,
    ),
  );
}
