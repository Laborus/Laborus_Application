import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/core/components/buttons/edit_icon.dart';

class ProfilePicture extends StatelessWidget {
  final String imagePath;
  final VoidCallback onEdit;

  const ProfilePicture({
    super.key,
    required this.imagePath,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 67,
          height: 67,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9999),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: -3,
          bottom: -5,
          child: EditIcon(
            onTap: onEdit,
            color: AppColors.primaryPurple,
            iconColor: AppColors.neutralsDark[800]!,
          ),
        ),
      ],
    );
  }
}
