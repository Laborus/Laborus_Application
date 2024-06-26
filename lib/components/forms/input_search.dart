import 'package:flutter/material.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Provider.of<PalletTheme>(context).neutral500,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        cursorColor: Provider.of<PalletTheme>(context).neutral300,
        style: TextStyle(
          color: Provider.of<PalletTheme>(context).neutral300,
        ),
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: Provider.of<PalletTheme>(context).neutral300,
          ),
          hintText: 'Digite alguma coisa...',
          hintStyle: TextStyle(
            color: Provider.of<PalletTheme>(context).neutral300,
          ),
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        ),
      ),
    );
  }
}
