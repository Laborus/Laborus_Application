import 'package:flutter/material.dart';
import 'package:laborus_app/providers/theme_provider.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<PalletTheme>(context).neutral200,
      child: Center(
        child: ElevatedButton(
          child: Text('hi'),
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            Provider.of<PalletTheme>(context, listen: false).update();
          },
        ),
      ),
    );
  }
}
