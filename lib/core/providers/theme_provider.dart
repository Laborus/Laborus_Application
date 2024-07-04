import 'package:flutter/material.dart';
import 'package:laborus_app/core/data/local_database.dart';
import 'package:laborus_app/core/utils/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = LAppTheme.lightTheme;
  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
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

  Future<void> loadTheme(BuildContext context) async {
    final isDarkMode = await LocalDatabase.getTheme(context: context);

    themeData = isDarkMode ? LAppTheme.darkTheme : LAppTheme.lightTheme;
  }
}
