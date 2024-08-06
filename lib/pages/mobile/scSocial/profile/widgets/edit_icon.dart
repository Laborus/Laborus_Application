import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class EditIcon extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final Color iconColor;

  const EditIcon({
    super.key,
    required this.onTap,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Icon(
          Icons.add_photo_alternate_outlined,
          size: AppFontSize.medium,
          color: iconColor,
        ),
      ),
    );
  }
}
