import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/utils/theme/custom/pallet_theme.dart';

class OptionComponent extends StatelessWidget {
  final String text;
  final String imageAsset;
  final double width;
  const OptionComponent({
    super.key,
    required this.text,
    required this.imageAsset,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: PalletTheme().neutral600,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(imageAsset),
          Text(
            text,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
              color: PalletTheme().neutral600,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => context.goNamed('info'),
            icon: Icon(
              Icons.arrow_forward_ios,
              color: PalletTheme().neutral600,
            ),
          )
        ],
      ),
    );
  }
}
