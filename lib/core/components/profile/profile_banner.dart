import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/core/components/buttons/edit_icon.dart';

class ProfileBanner extends StatelessWidget {
  final String imagePath;
  final VoidCallback onEdit;

  const ProfileBanner({
    super.key,
    required this.imagePath,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 162,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 22,
          bottom: 5,
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
