import 'package:flutter/material.dart';

class InfoProfile extends StatelessWidget {
  const InfoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ana Maria',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onTertiary,
              fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.school,
                size: Theme.of(context).textTheme.bodyMedium!.fontSize,
                color: Theme.of(context).colorScheme.tertiaryContainer,
              ),
              const SizedBox(width: 5),
              Text(
                'Fatec Carapicuíba',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
