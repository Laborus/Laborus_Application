import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/constants/colors.dart';

class indicatorTimeline extends StatelessWidget {
  const indicatorTimeline({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.darknessPurple,
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 18,
          color: AppColors.neutralsLight[0],
        ),
      ),
    );
  }
}
