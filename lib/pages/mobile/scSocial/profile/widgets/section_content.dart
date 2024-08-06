import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class SectionContent extends StatelessWidget {
  final String content;

  const SectionContent({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        fontWeight: FontWeight.w500,
        fontSize: AppFontSize.small,
      ),
    );
  }
}
