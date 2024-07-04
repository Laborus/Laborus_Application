import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/forms/label_button.dart';

class SaveTab extends StatelessWidget {
  const SaveTab({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 1,
      alignment: Alignment.topLeft,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 34, left: 14, right: 14, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  LabelButton(checked: true, label: 'Todas'),
                  SizedBox(width: 13),
                  LabelButton(checked: false, label: 'Posts'),
                  SizedBox(width: 13),
                  LabelButton(checked: false, label: 'Vagas'),
                ],
              ),
            ),
            const SizedBox(height: 21),
            Column(
              children: [
                Center(
                  child: Text(
                    'Publicações ou vagas de emprego salvas aparecerão aqui...',
                    textAlign: TextAlign.center,
                    style: const TextTheme().titleSmall,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
