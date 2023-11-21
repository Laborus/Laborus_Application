import 'package:laborus_app/data/theme_database.dart';

mixin DarkMode {
  static bool _isDarkMode = false;

  static Future<bool> get isDarkMode async {
    final brightness = await ThemeDatabase.getTheme();
    _isDarkMode = brightness;
    return _isDarkMode;
  }
}
