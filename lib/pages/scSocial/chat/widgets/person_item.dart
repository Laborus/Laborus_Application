import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laborus_app/core/model/social/people.dart';

class PersonItem extends StatelessWidget {
  const PersonItem({
    super.key,
    required this.people,
  });
  final People people;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(people.image),
        radius: 30,
      ),
      horizontalTitleGap: 16,
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        people.name,
        style: const TextTheme().titleMedium,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        people.name,
        style: const TextTheme().titleSmall,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          DateFormat.jm().format(people.lastVisited),
          style: const TextTheme().bodySmall,
        ),
        Icon(
          Icons.done_all_rounded,
          color: Theme.of(context).colorScheme.primary,
        )
      ]),
    );
  }
}
