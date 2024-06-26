import 'package:flutter/material.dart';
import 'package:laborus_app/pages/scSocial/profile/widgets/about_tab.dart';
import 'package:laborus_app/pages/scSocial/profile/widgets/activity_tab.dart';
import 'package:laborus_app/pages/scSocial/profile/widgets/follow_tab.dart';
import 'package:laborus_app/pages/scSocial/profile/widgets/profile_header.dart';
import 'package:laborus_app/pages/scSocial/profile/widgets/save_tab.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 300,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const ProfileHeader(),
          leadingWidth: double.infinity,
          bottom: TabBar(
            isScrollable: width > 340 ? false : true,
            tabs: [
              tab('Sobre', context),
              tab('Seguindo', context),
              tab('Atividade', context),
              tab('Salvos', context),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AboutTab(),
            FollowTab(),
            ActivityTab(),
            SaveTab(),
          ],
        ),
      ),
    );
  }

  Tab tab(text, ctx) {
    return Tab(
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Theme.of(ctx).appBarTheme.foregroundColor),
      ),
    );
  }
}
