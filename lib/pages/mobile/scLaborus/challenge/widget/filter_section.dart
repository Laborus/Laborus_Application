import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/forms/input_search.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(child: InputSearch()),
              const SizedBox(width: 13),
              IconButton(
                icon: const Icon(Icons.tune_rounded),
                color: Theme.of(context).colorScheme.tertiaryContainer,
                iconSize: AppFontSize.xxxLarge,
                splashColor: Theme.of(context).colorScheme.secondary,
                highlightColor: Theme.of(context).colorScheme.secondary,
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.all(12),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Chip(
                label: Text(
                  'Iniciante',
                  style: TextStyle(
                    color: AppColors.neutralsDark[800],
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSize.small,
                    fontFamily: 'Inter',
                  ),
                ),
                labelPadding: const EdgeInsets.all(0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                backgroundColor: AppColors.green,
              ),
              const SizedBox(width: 5),
              Chip(
                label: Text(
                  'Intermediário',
                  style: TextStyle(
                    color: AppColors.neutralsDark[800],
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSize.small,
                    fontFamily: 'Inter',
                  ),
                ),
                labelPadding: const EdgeInsets.all(0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
              ),
              const SizedBox(width: 5),
              Chip(
                label: Text(
                  'Avançado',
                  style: TextStyle(
                    color: AppColors.neutralsDark[800],
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSize.small,
                    fontFamily: 'Inter',
                  ),
                ),
                labelPadding: const EdgeInsets.all(0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
