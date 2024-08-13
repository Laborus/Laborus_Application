import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/list/generic_list_builder_separated.dart';
import 'package:laborus_app/core/components/list/generic_list_tile.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class QuestionsSection extends StatelessWidget {
  const QuestionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(22),
          child: Row(
            children: [
              Text(
                'Desafios encontrados',
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
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
        GenericListBuilderSeparated(
          itemCount: 2,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return GenericListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                radius: 25,
                child: Text(
                  'ADS',
                  style: TextStyle(
                    fontSize: AppFontSize.medium,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              title: 'Equação de 2º grau com Python',
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.school_outlined,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        size: 10,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        'Análise e Desenvolvimento de Sistemas',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    '+ 20 Pontos no Ranking',
                    style: TextStyle(
                      fontSize: AppFontSize.small,
                      fontWeight: FontWeight.w500,
                      color: AppColors.green,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              isThreeLine: true,
              tileColor: Theme.of(context).colorScheme.primary,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 1),
        ),
      ],
    );
  }
}
