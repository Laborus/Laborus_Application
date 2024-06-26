import 'package:flutter/material.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

Widget buildTextSection(BuildContext context) {
  return Column(
    children: [
      Text(
        'Escolha sua conta',
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
          fontWeight: FontWeight.bold,
          color: Provider.of<PalletTheme>(context).neutral800,
        ),
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: 260,
        child: Text(
          'Selecione a opção que corresponde a sua necessidade:',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
            fontWeight: FontWeight.w200,
            color: Provider.of<PalletTheme>(context).neutral800,
          ),
        ),
      ),
    ],
  );
}
