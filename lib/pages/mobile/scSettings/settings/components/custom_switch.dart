import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/core/utils/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:laborus_app/core/providers/settings_provider.dart';

class CustomSwitch extends StatelessWidget {
  final bool isThemeSwitch;

  const CustomSwitch({
    super.key,
    required this.isThemeSwitch,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, child) {
        bool switchValue = isThemeSwitch
            ? settingsProvider.themeData == LAppTheme.darkTheme
            : settingsProvider.notificationsEnabled;

        return GestureDetector(
          onTap: () {
            if (isThemeSwitch) {
              settingsProvider.toggleTheme();
            } else {
              settingsProvider.toggleNotifications();
            }
          },
          child: Container(
            height: 30,
            width: 60,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 500),
              alignment:
                  switchValue ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
