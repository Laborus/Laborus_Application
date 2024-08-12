import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/generics/avatar_picture.dart';
import 'package:laborus_app/core/components/list/generic_list_builder_separated.dart';
import 'package:laborus_app/core/components/list/notification_tile.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class CampusTab extends StatelessWidget {
  const CampusTab({super.key});

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
                  'Notificações',
                  style: TextStyle(
                    fontSize: AppFontSize.xxLarge,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                ),
                const SizedBox(width: 3),
                Text(
                  '2',
                  style: TextStyle(
                    fontSize: AppFontSize.xxLarge,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
              ],
            ),
          ),
          GenericListBuilderSeparated(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            itemCount: 3,
            separatorBuilder: (context, index) => const SizedBox(
              height: 1,
            ),
            itemBuilder: (context, index) => NotificationTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 16,
              ),
              leading: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.primaryPurple,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  const SizedBox(width: 3),
                  AvatarPicture(
                    imagePath: 'assets/img/profile.jpg',
                    size: 40,
                  ),
                ],
              ),
              title: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Maria Clara Júnior ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                    TextSpan(
                      text: "enviou uma solicitação de conexão",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ],
                ),
                style: const TextStyle(fontSize: AppFontSize.medium),
                maxLines: null,
              ),
              subtitle: const Text(
                "46 segundos atrás",
                style: TextStyle(
                  fontSize: AppFontSize.small,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryPurple,
                ),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    constraints: BoxConstraints.tight(Size(28, 28)),
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.all(0),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.onTertiary,
                      size: AppFontSize.xxLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
