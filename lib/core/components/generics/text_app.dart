import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class TextApp extends StatelessWidget {
  final String label;
  final List<Color> colors;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign alignment;
  final TextOverflow overflow;
  const TextApp({
    super.key,
    required this.label,
    required this.colors,
    this.fontWeight = FontWeight.w400,
    this.fontSize = AppFontSize.medium,
    this.alignment = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Text(
      label,
      textAlign: alignment,
      overflow: overflow,
      style: TextStyle(
        color: isDarkMode ? colors[0] : colors[1],
        fontWeight: fontWeight,
        letterSpacing: 0,
        fontSize: fontSize,
      ),
    );
  }
}
