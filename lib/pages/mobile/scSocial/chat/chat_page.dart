import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/forms/input_search.dart';
import 'package:laborus_app/pages/mobile/scSocial/chat/widgets/person_list.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Theme.of(context).colorScheme.onPrimary,
      padding: const EdgeInsets.only(top: 21, left: 21, right: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputSearch(),
          const SizedBox(height: 13),
          const Expanded(
            child: PersonList(),
          ),
        ],
      ),
    );
  }
}
