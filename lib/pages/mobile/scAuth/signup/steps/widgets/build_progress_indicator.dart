import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class BuildProgressIndicator extends StatelessWidget {
  final int step;
  final int remainingSteps;
  const BuildProgressIndicator(
      {super.key, required this.step, required this.remainingSteps});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: step,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              color: AppColors.darknessPurple,
            ),
            height: 4,
          ),
        ),
        Expanded(
          flex: remainingSteps,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Theme.of(context).colorScheme.secondary,
            ),
            height: 4,
          ),
        ),
      ],
    );
  }
}
