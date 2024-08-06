import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onTertiary,
        fontWeight: FontWeight.bold,
        fontSize: AppFontSize.large,
      ),
    );
  }
}
