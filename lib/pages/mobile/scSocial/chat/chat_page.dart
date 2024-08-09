import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/forms/input_search.dart';
import 'package:laborus_app/core/components/navigation/custom_appbar_bottom.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/pages/mobile/scSocial/chat/widgets/persons_section.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        appBar: CustomAppBarBottom(
          leading: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: InputSearch(),
          ),
          bottom: TabBar(
            dividerColor: Theme.of(context).colorScheme.primary,
            indicatorColor: AppColors.primaryPurple,
            labelColor: AppColors.primaryPurple,
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.tab,
            tabAlignment: TabAlignment.start,
            padding: const EdgeInsets.only(left: 22),
            isScrollable: true,
            tabs: const [
              Tab(
                height: 34,
                text: 'Conexões',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [PersonsSection()],
        ),
      ),
    );
  }
}
