import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class LTextFieldTheme {
  LTextFieldTheme._();

  static InputDecorationTheme lightTextFieldTheme = InputDecorationTheme(
    // Borda do TextField quando não está focado
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.neutralsLight[500] as Color),
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
    ),
    // Borda do TextField quando está focado
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.darknessPurple),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),

    labelStyle: TextStyle(
      color: AppColors.neutralsLight[500] as Color,
      fontSize: 14,
    ),
    alignLabelWithHint: true,

    hintStyle: TextStyle(
      color: AppColors.neutralsLight[500] as Color,
      fontSize: 14,
    ),

    suffixIconColor: AppColors.neutralsDark[500] as Color,
  );

  static InputDecorationTheme darkTextFieldTheme = InputDecorationTheme(
    // Borda do TextField quando não está focado
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.neutralsDark[500] as Color),
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
    ),

    // Borda do TextField quando está focado
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.darknessPurple,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
    alignLabelWithHint: true,
    labelStyle: TextStyle(
      color: AppColors.neutralsDark[500] as Color,
      fontSize: 14,
    ),
    suffixIconColor: AppColors.neutralsDark[500] as Color,
  );
}
