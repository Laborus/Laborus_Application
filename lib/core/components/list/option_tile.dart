import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/switch/custom_switch.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class Option extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSwitch;
  final bool? isThemeSwitch;
  final bool isSignOut;
  final VoidCallback? callback;

  const Option({
    Key? key,
    required this.icon,
    required this.text,
    required this.isSwitch,
    this.isThemeSwitch,
    this.isSignOut = false,
    this.callback,
  }) : super(key: key);

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      style: ListTileStyle.list,
      tileColor: widget.isSignOut
          ? AppColors.lightRed
          : Theme.of(context).colorScheme.primary,
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 22),
      leading: Icon(
        widget.icon,
        size: Theme.of(context).textTheme.headlineLarge?.fontSize,
        color: widget.isSignOut
            ? AppColors.red
            : Theme.of(context).colorScheme.onTertiary,
      ),
      title: Text(
        widget.text,
        style: TextStyle(
          fontSize: AppFontSize.medium,
          fontWeight: FontWeight.w500,
          color: widget.isSignOut
              ? AppColors.red
              : Theme.of(context).colorScheme.onTertiary,
        ),
      ),
      trailing: widget.isSwitch
          ? CustomSwitch(isThemeSwitch: widget.isThemeSwitch ?? false)
          : null,
      onTap: widget.isSwitch ? null : widget.callback ?? () {},
    );
  }
}
