import 'package:flutter/material.dart';
import 'package:laborus_app/pages/mobile/scSocial/profile/widgets/profile_banner.dart';
import 'package:laborus_app/pages/mobile/scSocial/profile/widgets/profile_picture.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  void _editBanner() {}

  void _editProfilePicture() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          clipBehavior: Clip.none,
          children: [
            ProfileBanner(
              imagePath: 'assets/img/profile_banner.png',
              onEdit: _editBanner,
            ),
            Positioned(
              left: 22,
              bottom: -47,
              child: ProfilePicture(
                imagePath: 'assets/img/profile.jpg',
                onEdit: _editProfilePicture,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
