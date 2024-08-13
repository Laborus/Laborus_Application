import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/generics/avatar_picture.dart';
import 'package:laborus_app/core/components/list/generic_list_builder_separated.dart';
import 'package:laborus_app/core/components/list/generic_list_tile.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class YoungApprenticeTab extends StatelessWidget {
  const YoungApprenticeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(22),
            child: Row(
              children: [
                Text(
                  'Vagas encontradas ',
                  style: TextStyle(
                    fontSize: AppFontSize.xxLarge,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                ),
                const SizedBox(width: 3),
                Text(
                  '4',
                  style: TextStyle(
                    fontSize: AppFontSize.xxLarge,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
          GenericListBuilderSeparated(
            itemCount: 8,
            itemBuilder: (context, index) {
              return GenericListTile(
                isThreeLine: true,
                leading: const AvatarPicture(
                  imagePath: 'assets/img/profile.jpg',
                  size: 40,
                ),
                title: 'Estágio Presencial (2024)',
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.work_outline,
                          color: Theme.of(context).colorScheme.tertiary,
                          size: AppFontSize.small,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          'Santander',
                          style: TextStyle(
                            fontSize: AppFontSize.small,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Theme.of(context).colorScheme.tertiary,
                          size: AppFontSize.small,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          'Osasco | SP',
                          style: TextStyle(
                            fontSize: AppFontSize.small,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: IconButton(
                  padding: EdgeInsets.all(4),
                  alignment: Alignment.center,
                  constraints: BoxConstraints(),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  color: AppColors.neutralsLight[0]!,
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.onTertiary,
                    size: AppFontSize.xxLarge,
                  ),
                  onPressed: () {},
                ),
                tileColor: Theme.of(context).colorScheme.primary,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 1),
          ),
        ],
      ),
    );
  }
}
