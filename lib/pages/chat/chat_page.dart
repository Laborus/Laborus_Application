import 'package:flutter/material.dart';
import 'package:laborus_app/components/input_search.dart';
import 'package:laborus_app/pages/chat/widgets/group_list.dart';
import 'package:laborus_app/pages/chat/widgets/person_list.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<PalletTheme>(context).neutral200,
      padding: const EdgeInsets.only(top: 21, left: 21, right: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputSearch(
            margin: 24,
          ),
          const SizedBox(height: 13),
          Text(
            'Grupos',
            style: const TextTheme().titleMedium,
          ),
          const GroupList(),
          const Expanded(
            child: PersonList(),
          ),
        ],
      ),
    );
  }
}
