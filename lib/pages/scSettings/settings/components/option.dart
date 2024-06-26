import 'package:flutter/material.dart';
import 'package:laborus_app/pages/scSettings/settings/components/custom_switch.dart';

class Option extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSwitch;

  const Option({
    Key? key,
    required this.icon,
    required this.text,
    required this.isSwitch,
  }) : super(key: key);

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(widget.icon),
              const SizedBox(width: 22),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          if (widget.isSwitch) const CustomSwitch(),
        ],
      ),
    );
  }
}
