import 'package:flutter/material.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

Widget buildRichText(
    List<String> textParts, List<bool> boldFlags, BuildContext context) {
  assert(textParts.length == boldFlags.length,
      "textParts and boldFlags should have the same length");

  List<TextSpan> textSpans = [];

  for (int i = 0; i < textParts.length; i++) {
    TextStyle textStyle = TextStyle(
      color: Provider.of<PalletTheme>(context).neutral500,
      fontSize: 14,
    );

    if (boldFlags[i]) {
      textStyle = textStyle.copyWith(
        fontWeight: FontWeight.w700,
        color: Provider.of<PalletTheme>(context).neutral600,
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
