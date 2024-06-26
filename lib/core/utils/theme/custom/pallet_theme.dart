import 'package:flutter/material.dart';
import 'package:laborus_app/core/data/local_database.dart';
import 'package:laborus_app/core/utils/constants/colors.dart';

class PalletTheme with ChangeNotifier {
  PalletTheme();

  static late bool _isDarkMode;
  static const Map<int, Color> _dark = AppColors.neutralsDark;
  static const Map<int, Color> _light = AppColors.neutralsLight;

  Color get neutral0 => _isDarkMode ? _dark[0]! : _light[0]!;
  Color get neutral100 => _isDarkMode ? _dark[100]! : _light[100]!;
  Color get neutral200 => _isDarkMode ? _dark[200]! : _light[200]!;
  Color get neutral300 => _isDarkMode ? _dark[300]! : _light[300]!;
  Color get neutral400 => _isDarkMode ? _dark[400]! : _light[400]!;
  Color get neutral500 => _isDarkMode ? _dark[500]! : _light[500]!;
  Color get neutral600 => _isDarkMode ? _dark[600]! : _light[600]!;
  Color get neutral700 => _isDarkMode ? _dark[700]! : _light[700]!;
  Color get neutral800 => _isDarkMode ? _dark[800]! : _light[800]!;
  Color get logo => _isDarkMode ? _dark[200]! : _light[200]!;

  Future<void> init() async {
    _isDarkMode = await isDarkMode();
  }

  Future<bool> isDarkMode() async {
    final brightness = await LocalDatabase.getTheme();
    _isDarkMode = brightness;
    return _isDarkMode;
  }

  Future<void> update() async {
    _isDarkMode = await isDarkMode();
    notifyListeners();
  }
}
