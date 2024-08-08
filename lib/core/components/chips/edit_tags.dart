import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class EditTags extends StatelessWidget {
  const EditTags({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: [
          Icon(
            Icons.edit_outlined,
            size: 16,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            'Editar tags',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onTertiary,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
