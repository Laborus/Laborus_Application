import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class GenericListTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final EdgeInsetsGeometry contentPadding;
  final Color? tileColor;

  const GenericListTile({
    super.key,
    this.leading,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
    this.tileColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: tileColor ?? Theme.of(context).colorScheme.primary,
      titleAlignment: ListTileTitleAlignment.center,
      leading: leading,
      horizontalTitleGap: 12,
      contentPadding: contentPadding,
      title: Text(
        title,
        style: TextStyle(
          fontSize: AppFontSize.medium,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: AppFontSize.small,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.tertiaryContainer,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: trailing,
    );
  }
}
