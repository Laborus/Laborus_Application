import 'package:flutter/material.dart';
import 'package:laborus_app/pages/mobile/scSettings/settings/components/custom_switch.dart';

class Option extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSwitch;
  final bool? isThemeSwitch;
  final bool isSignOut;

  const Option({
    Key? key,
    required this.icon,
    required this.text,
    required this.isSwitch,
    this.isThemeSwitch,
    this.isSignOut = false,
  }) : super(key: key);

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
      color: widget.isSignOut
          ? const Color.fromRGBO(255, 244, 244, 1)
          : Theme.of(context).colorScheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                widget.icon,
                size: Theme.of(context).textTheme.headlineLarge?.fontSize,
                color: widget.isSignOut
                    ? const Color.fromRGBO(229, 39, 39, 1)
                    : Theme.of(context).colorScheme.onTertiary,
              ),
              const SizedBox(width: 12),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                  fontWeight: FontWeight.w500,
                  color: widget.isSignOut
                      ? const Color.fromRGBO(229, 39, 39, 1)
                      : Theme.of(context).colorScheme.onTertiary,
                ),
              ),
            ],
          ),
          if (widget.isSwitch)
            CustomSwitch(isThemeSwitch: widget.isThemeSwitch!),
        ],
      ),
    );
  }
}
