import 'package:flutter/material.dart';
import 'package:laborus_app/utils/constants/colors.dart';
import 'package:laborus_app/utils/mixins/is_dark_mode.dart';

class PalletTheme with DarkMode {
  PalletTheme._();

  static late bool _isDarkMode;
  static const Map<int, Color> _dark = AppColors.neutralsLight;
  static const Map<int, Color> _light = AppColors.neutralsDark;

  static Color get neutral0 => _isDarkMode ? _dark[0]! : _light[0]!;
  static Color get neutral100 => _isDarkMode ? _dark[100]! : _light[100]!;
  static Color get neutral200 => _isDarkMode ? _dark[200]! : _light[200]!;
  static Color get neutral300 => _isDarkMode ? _dark[300]! : _light[300]!;
  static Color get neutral400 => _isDarkMode ? _dark[400]! : _light[400]!;
  static Color get neutral500 => _isDarkMode ? _dark[500]! : _light[500]!;
  static Color get neutral600 => _isDarkMode ? _dark[600]! : _light[600]!;
  static Color get neutral700 => _isDarkMode ? _dark[700]! : _light[700]!;
  static Color get neutral800 => _isDarkMode ? _dark[800]! : _light[800]!;

  static Future<void> init() async {
    _isDarkMode = await DarkMode.isDarkMode;
  }
}
