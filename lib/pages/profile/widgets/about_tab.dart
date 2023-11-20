import 'package:flutter/material.dart';
import 'package:laborus_app/components/label_button.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 1,
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 34),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Interesses',
                  style: const TextTheme().headlineSmall,
                ),
                const SizedBox(height: 13),
                const Row(
                  children: [
                    LabelButton(checked: true, label: 'Design'),
                    SizedBox(width: 13),
                    LabelButton(checked: true, label: 'Marketing'),
                    SizedBox(width: 13),
                    LabelButton(checked: true, label: 'Fotografia'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 21),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Interesses',
                  style: const TextTheme().headlineSmall,
                ),
                const SizedBox(height: 13),
                Text(
                  'Arte é minha maior paixão, eu sou gamada em Fotografia e Design...Marketing também haha me adiciona ai para conversamos! :)',
                  style: const TextTheme().bodyMedium,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
