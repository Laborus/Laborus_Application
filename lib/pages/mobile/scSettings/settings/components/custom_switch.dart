import 'package:flutter/material.dart';
import 'package:laborus_app/core/data/local_database.dart';
import 'package:laborus_app/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: LocalDatabase.getTheme(context: context),
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
                    color: Theme.of(context).colorScheme.primary,
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
