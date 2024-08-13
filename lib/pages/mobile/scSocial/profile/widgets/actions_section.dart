import 'package:flutter/material.dart';

class ActionsSection extends StatelessWidget {
  const ActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Theme.of(context).colorScheme.secondary,
              ),
            ),
            child: Text(
              'Publicações',
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onTertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          TextButton(
            onPressed: () {},
            child: Text(
              'Comentários',
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
