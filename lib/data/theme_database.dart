import 'package:hive/hive.dart';

class ThemeDatabase {
  static const String boxName = 'themeBox';

  static Future<void> saveTheme(bool isDarkMode) async {
    final box = await Hive.openBox(boxName);
    await box.put('isDarkMode', isDarkMode);
    await box.close();
  }

  static Future<bool> getTheme() async {
    final box = await Hive.openBox(boxName);
    final isDarkMode = box.get('isDarkMode', defaultValue: false);
    await box.close();
    return isDarkMode;
  }
}
