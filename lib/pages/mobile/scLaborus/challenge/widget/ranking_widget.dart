import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/generics/avatar_picture.dart';
import 'package:laborus_app/core/components/list/generic_list_builder_separated.dart';
import 'package:laborus_app/core/components/list/generic_list_tile.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class RankingWidget extends StatelessWidget {
  const RankingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: Icon(
                  Icons.emoji_events_outlined,
                  color: AppColors.neutralsDark[800],
                  size: 33,
                ),
              ),
              const SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TOP 3',
                    style: TextStyle(
                      fontSize: AppFontSize.medium,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                  ),
                  Text(
                    'Alunos',
                    style: TextStyle(
                      fontSize: AppFontSize.xLarge,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GenericListBuilderSeparated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return GenericListTile(
                  leading: const AvatarPicture(
                    imagePath: 'assets/img/profile.jpg',
                    size: 40,
                  ),
                  title: 'Rogério Azevedo',
                  subtitle: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.school_outlined,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: AppFontSize.small,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        'Pontuação: 1000',
                        style: TextStyle(
                          fontSize: AppFontSize.small,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),
                  tileColor: index == 1
                      ? AppColors.lightGreen
                      : Theme.of(context).colorScheme.onPrimary,
                );
              },
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
