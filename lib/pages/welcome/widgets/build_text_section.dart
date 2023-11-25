import 'package:flutter/material.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';

Widget buildTextSection(BuildContext context) {
  return Column(
    children: [
      Text(
        'Vamos lá!',
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
          fontWeight: FontWeight.bold,
          color: PalletTheme().neutral800,
        ),
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: 260,
        child: Text(
          'Bem-vindo(a) a Laborus! Crie uma nova conta ou acesse uma já existente.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
            fontWeight: FontWeight.w200,
            color: PalletTheme().neutral800,
          ),
        ),
      ),
    ],
  );
}
