
import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class GenericListTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final Widget subtitle;
  final Widget? trailing;
  final EdgeInsetsGeometry contentPadding;
  final Color? tileColor;
  final bool? isThreeLine;

  const GenericListTile({
    super.key,
    this.leading,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
    this.tileColor,
    this.isThreeLine = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        isThreeLine: isThreeLine!,
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
        subtitle: subtitle,
        trailing: trailing,
      ),
    );
  }
}
