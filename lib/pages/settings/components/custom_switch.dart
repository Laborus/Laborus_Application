import 'package:flutter/material.dart';
import 'package:laborus_app/data/local_database.dart';
import 'package:laborus_app/providers/theme_provider.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: LocalDatabase.getTheme(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else {
          bool switchValue = snapshot.data ?? false;

          return GestureDetector(
            onTap: () {
              setState(() {
                switchValue = !switchValue;
              });
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              Provider.of<PalletTheme>(context, listen: false).update();
            },
            child: Container(
              height: 30,
              width: 60,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: Colors.black),
                color: Colors.transparent,
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
                    color: switchValue ? Colors.white : Colors.black,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    switchValue ? Icons.light_mode : Icons.dark_mode,
                    size: 16,
                    color: Provider.of<PalletTheme>(context).neutral0,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
