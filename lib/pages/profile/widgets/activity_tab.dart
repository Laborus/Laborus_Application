import 'package:flutter/material.dart';
import 'package:laborus_app/components/label_button.dart';
import 'package:laborus_app/components/post_card.dart';

class ActivityTab extends StatelessWidget {
  const ActivityTab({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 1,
      alignment: Alignment.topLeft,
      child: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 34, left: 14, right: 14, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
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
              SizedBox(height: 21),
              Column(
                children: [
                  PostWidget(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
