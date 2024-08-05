import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {
  static const String _isDarkModeKey = 'isDarkMode';
  static const String _notificationsEnabledKey = 'notificationsEnabled';
  static const String _onboardingKey = 'onboardingShown';

  static Future<void> init() async {
    await SharedPreferences.getInstance();
  }

  static Future<void> saveTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isDarkModeKey, isDarkMode);
  }

  static Future<bool> getTheme({required BuildContext context}) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_isDarkModeKey)) {
      return prefs.getBool(_isDarkModeKey) ?? false;
    } else {
      // ignore: use_build_context_synchronously
      final brightness = MediaQuery.of(context).platformBrightness;
      return brightness == Brightness.dark;
    }
  }

  static Future<void> saveNotifications(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notificationsEnabledKey, enabled);
  }

  static Future<bool> getNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_notificationsEnabledKey) ?? true;
  }

  static Future<void> setOnboardingShown() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingKey, true);
  }

  static Future<bool> isOnboardingShown() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingKey) ?? false;
  }
}
