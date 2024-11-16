import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/generics/text_app.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class ProfileTag extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color? textColor;
  final IconData iconData;
  const ProfileTag({
    super.key,
    required this.label,
    required this.iconData,
    this.backgroundColor = AppColors.violet,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(
        iconData,
        color: textColor,
      ),
      backgroundColor: backgroundColor,
      label: TextApp(
        label: label,
        color: textColor!,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
