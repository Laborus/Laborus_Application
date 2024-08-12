import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class TextButtonIcon extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final Color backgroundColor;
  final IconData icon;
  final String label;

  const TextButtonIcon({
    super.key,
    required this.onTap,
    required this.color,
    required this.backgroundColor,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: AppFontSize.medium,
              color: color,
            ),
            const SizedBox(width: 3),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: AppFontSize.small,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
