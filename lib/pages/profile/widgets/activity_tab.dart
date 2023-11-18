import 'package:flutter/material.dart';
import 'package:laborus_app/global_widgets/label_button.dart';
import 'package:laborus_app/global_widgets/post_card.dart';

class ActivityTab extends StatelessWidget {
  const ActivityTab({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 1,
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 34, left: 14,right: 14, bottom: 24),
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
                    LabelButton(checked: false, label: 'Discussões'),
                  ],
                ),
              ),
              const SizedBox(height: 21),
              Column(
                children: [
                  post(context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
