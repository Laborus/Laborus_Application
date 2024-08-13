import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final EdgeInsetsGeometry contentPadding;
  final Color? tileColor;

  const NotificationTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
    this.tileColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: contentPadding,
      color: tileColor ?? Theme.of(context).colorScheme.primary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leading != null) leading!,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  subtitle!,
                ],
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
