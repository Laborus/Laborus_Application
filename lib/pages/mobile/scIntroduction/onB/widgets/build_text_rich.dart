import 'package:flutter/material.dart';

Widget buildRichText(
    List<String> textParts, List<bool> boldFlags, BuildContext context) {
  assert(textParts.length == boldFlags.length,
      "textParts and boldFlags should have the same length");

  List<TextSpan> textSpans = [];

  for (int i = 0; i < textParts.length; i++) {
    TextStyle textStyle = TextStyle(
      color: Theme.of(context).colorScheme.onSecondary,
      fontSize: 14,
    );

    if (boldFlags[i]) {
      textStyle = textStyle.copyWith(
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.tertiary,
      );
    }

    textSpans.add(TextSpan(
      text: textParts[i],
      style: textStyle,
    ));
  }

  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(children: textSpans),
  );
}
