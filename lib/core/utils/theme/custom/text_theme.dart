import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/app_text_style.dart';

class LTextTheme {
  const LTextTheme._();

  static final TextTheme darkTheme = TextTheme(
    headlineLarge: AppTextStyle.xxxLargeWhiteBold,
    headlineMedium: AppTextStyle.xxLargeWhite,
    headlineSmall: AppTextStyle.xLargeWhite,
    titleLarge: AppTextStyle.largeWhite,
    titleMedium: AppTextStyle.mediumWhite,
    titleSmall: AppTextStyle.smallWhite,
    bodyLarge: AppTextStyle.mediumWhite,
    bodyMedium: AppTextStyle.smallWhite,
    bodySmall: AppTextStyle.xSmallWhite,
    labelLarge: AppTextStyle.largeWhite,
    labelMedium: AppTextStyle.mediumWhite,
    labelSmall: AppTextStyle.smallWhite,
  );

  static final TextTheme lightTheme = TextTheme(
    headlineLarge: AppTextStyle.xxxLargeBlackBold,
    headlineMedium: AppTextStyle.xxLargeBlack,
    headlineSmall: AppTextStyle.xLargeBlack,
    titleLarge: AppTextStyle.largeBlack,
    titleMedium: AppTextStyle.mediumBlack,
    titleSmall: AppTextStyle.smallBlack,
    bodyLarge: AppTextStyle.mediumBlack,
    bodyMedium: AppTextStyle.smallBlack,
    bodySmall: AppTextStyle.xSmallBlack,
    labelLarge: AppTextStyle.largeBlack,
    labelMedium: AppTextStyle.mediumBlack,
    labelSmall: AppTextStyle.smallBlack,
  );
}
