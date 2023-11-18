import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laborus_app/model/people.dart';
import 'package:laborus_app/utils/constants/constants.dart';

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
        style:
            font(Theme.of(context).appBarTheme.foregroundColor, FontWeight.w700)
                .titleMedium,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        people.name,
        style: font(Colors.grey, FontWeight.w500).titleSmall,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          DateFormat.jm().format(people.lastVisited),
          style: font(Colors.grey, FontWeight.w500).bodySmall,
        ),
        Icon(
          Icons.done_all_rounded,
          color: Theme.of(context).colorScheme.primary,
        )
      ]),
    );
  }
}
