import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laborus_app/core/components/generics/avatar_picture.dart';
import 'package:laborus_app/core/model/social/people.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class PersonTile extends StatelessWidget {
  const PersonTile({
    super.key,
    required this.people,
  });
  final People people;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.primary,
      titleAlignment: ListTileTitleAlignment.center,
      leading: AvatarPicture(
        imagePath: people.image,
        size: 50,
      ),
      horizontalTitleGap: 12,
      contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
      title: Text(
        people.name,
        style: TextStyle(
          fontSize: AppFontSize.medium,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        people.name,
        style: TextStyle(
          fontSize: AppFontSize.small,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.tertiaryContainer,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat.jm().format(people.lastVisited),
            style: TextStyle(
              fontSize: AppFontSize.small,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.tertiaryContainer,
            ),
          ),
          const SizedBox(height: 3),
          Icon(
            Icons.done_all_rounded,
            size: AppFontSize.xLarge,
            color: people.viewed
                ? AppColors.primaryPurple
                : Theme.of(context).colorScheme.tertiaryContainer,
          )
        ],
      ),
    );
  }
}
