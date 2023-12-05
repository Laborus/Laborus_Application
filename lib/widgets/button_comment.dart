import 'package:flutter/material.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

Widget buttonComment(BuildContext ctx) {
  return Tooltip(
    message: 'comentar',
    child: TextButton.icon(
      onPressed: null,
      icon: Icon(
        Icons.messenger_outline_rounded,
        color: Provider.of<PalletTheme>(ctx).neutral700,
      ),
      label: const Text('0'),
    ),
  );
}
