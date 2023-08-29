import 'package:flutter/material.dart';
import 'package:laborus_app/global_widgets/appBar.dart';
import 'package:laborus_app/global_widgets/input_search.dart';
import 'package:laborus_app/global_widgets/navigationBar.dart';
import 'package:laborus_app/pages/chat/view/widgets/group_list.dart';
import 'package:laborus_app/pages/chat/view/widgets/person_list.dart';
import 'package:laborus_app/utils/constants.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 288;
    return Scaffold(
      appBar: appbar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 21, left: 21, right: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InputSearch(margin: 24),
            const SizedBox(height: 13),
            Text(
              'Grupos',
              style: font(Theme.of(context).appBarTheme.foregroundColor,
                      FontWeight.w700)
                  .titleMedium,
            ),
            const GroupList(),
            PersonList(height: height)
          ],
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: navigation(context),
    );
  }
}
