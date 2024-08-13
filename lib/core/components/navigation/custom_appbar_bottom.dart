import 'package:flutter/material.dart';

class CustomAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double height;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomAppBarBottom({
    Key? key,
    this.leading,
    this.actions,
    this.bottom,
    this.height = kToolbarHeight,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(
        height + (bottom?.preferredSize.height ?? 0),
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      leadingWidth: double.maxFinite,
      actions: actions,
      bottom: bottom,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
    );
  }
}
