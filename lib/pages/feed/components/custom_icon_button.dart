import 'package:flutter/material.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String routeName;
  const CustomIconButton(
      {super.key, required this.icon, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: Provider.of<PalletTheme>(context).neutral100,
        ),
        child: Icon(icon),
      ),
    );
  }
}
