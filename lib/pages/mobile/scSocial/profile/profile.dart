import 'package:flutter/material.dart';
import 'package:laborus_app/pages/mobile/scSocial/profile/components/about_section.dart';
import 'package:laborus_app/pages/mobile/scSocial/profile/components/actions_section.dart';
import 'package:laborus_app/pages/mobile/scSocial/profile/components/profile_header.dart';
import 'package:laborus_app/pages/mobile/scSocial/profile/components/tags_section.dart';
import 'package:laborus_app/pages/mobile/scSocial/profile/widgets/info_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: const Column(
        children: [
          ProfileHeader(),
          SizedBox(height: 66),
          InfoProfile(),
          SizedBox(height: 13),
          TagsSection(),
          SizedBox(height: 13),
          AboutSection(),
          SizedBox(height: 13),
          ActionsSection(),
        ],
      ),
    );
  }
}
