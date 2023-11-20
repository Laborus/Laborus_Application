import 'package:flutter/material.dart';
import 'package:laborus_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('hi'),
          onPressed: () {
            print(MediaQuery.of(context).platformBrightness == Brightness.dark);
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
        ),
      ),
    );
  }
}
