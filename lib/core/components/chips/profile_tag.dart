import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class ProfileTag extends StatelessWidget {
  const ProfileTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(
        Icons.computer_rounded,
        color: AppColors.neutralsDark[800]!,
      ),
      backgroundColor: AppColors.violet,
      label: const Text('Tecnologia'),
    );
  }
}
