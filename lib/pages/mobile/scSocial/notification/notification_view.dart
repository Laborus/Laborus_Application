import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';
import 'package:laborus_app/pages/mobile/scSocial/notification/widgets/all_notifications_tab.dart';
import 'package:laborus_app/pages/mobile/scSocial/notification/widgets/campus_tab.dart';
import 'package:laborus_app/pages/mobile/scSocial/notification/widgets/following_tab.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3, // Defina o número de abas
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(
            dividerColor: Theme.of(context).colorScheme.primary,
            indicatorColor: AppColors.primaryPurple,
            labelColor: AppColors.primaryPurple,
            unselectedLabelColor: Theme.of(context).colorScheme.onSecondary,
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.tab,
            tabAlignment: TabAlignment.start,
            padding: const EdgeInsets.only(left: 22),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
              fontSize: AppFontSize.medium,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
              fontSize: AppFontSize.medium,
            ),
            tabs: const [
              Tab(
                height: 34,
                text: 'Todas',
              ),
              Tab(
                height: 34,
                text: 'Meu Campus',
              ),
              Tab(
                height: 34,
                text: 'Seguindo',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NotificationsTab(),
            CampusTab(),
            FollowingTab(),
          ],
        ),
      ),
    );
  }
}
