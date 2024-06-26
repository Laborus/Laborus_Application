import 'package:hive/hive.dart';

class LocalDatabase {
  static const String boxName = 'themeBox';
  static const String _onboardingKey = 'onboardingShown';

  static Future<void> saveTheme(bool isDarkMode) async {
    final box = await Hive.openBox(boxName);
    await box.put('isDarkMode', isDarkMode);
    await box.close();
  }

  static Future<bool> getTheme() async {
    final box = await Hive.openBox(boxName);
    final isDarkMode = box.get('isDarkMode', defaultValue: false);
    return isDarkMode;
  }

  static Future<void> setOnboardingShown() async {
    final box = await Hive.openBox('app_data');
    await box.put(_onboardingKey, true);
    await box.close();
  }

  static Future<bool> isOnboardingShown() async {
    final box = await Hive.openBox('app_data');
    final result = box.get(_onboardingKey, defaultValue: false);
    return result;
  }
}
