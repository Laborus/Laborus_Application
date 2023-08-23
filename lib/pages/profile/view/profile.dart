import 'package:flutter/material.dart';
import 'package:laborus_app/pages/profile/view/widgets/profile_header.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 293,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const ProfileHeader(),
          leadingWidth: double.infinity,
          bottom:TabBar(
            tabs: [
              tab('Sobre'),
              tab('Seguindo'),
              tab('Atividade'),
              tab('Salvos'),
            ],
          ),
        ),
        body: Container(),
      ),
    );
  }

  Tab tab(text) {
    return Tab(
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}
