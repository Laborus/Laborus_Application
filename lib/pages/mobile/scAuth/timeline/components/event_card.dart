import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final int index;
  final String label;
  const EventCard({
    super.key,
    required this.index,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Passo $index',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
              color: Theme.of(context).colorScheme.onTertiary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
