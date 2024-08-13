import 'package:flutter/material.dart';
import 'package:laborus_app/core/data/local_database.dart';
import 'package:laborus_app/core/utils/theme/theme.dart';

class SettingsProvider with ChangeNotifier {
  ThemeData _themeData = LAppTheme.lightTheme;
  bool _notificationsEnabled = true;

  ThemeData get themeData => _themeData;
  bool get notificationsEnabled => _notificationsEnabled;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  set notificationsEnabled(bool enabled) {
    _notificationsEnabled = enabled;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    if (_themeData == LAppTheme.lightTheme) {
      themeData = LAppTheme.darkTheme;
    } else {
      themeData = LAppTheme.lightTheme;
    }

    await LocalDatabase.saveTheme(_themeData == LAppTheme.darkTheme);
    notifyListeners();
  }

  Future<void> toggleNotifications() async {
    notificationsEnabled = !notificationsEnabled;
    await LocalDatabase.saveNotifications(notificationsEnabled);
    notifyListeners();
  }

  Future<void> loadSettings(BuildContext context) async {
    final isDarkMode = await LocalDatabase.getTheme(context: context);
    final areNotificationsEnabled = await LocalDatabase.getNotifications();

    themeData = isDarkMode ? LAppTheme.darkTheme : LAppTheme.lightTheme;
    notificationsEnabled = areNotificationsEnabled;
  }
}
