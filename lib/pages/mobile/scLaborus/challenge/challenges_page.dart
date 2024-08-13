import 'package:flutter/material.dart';
import 'package:laborus_app/pages/mobile/scLaborus/challenge/widget/filter_section.dart';
import 'package:laborus_app/pages/mobile/scLaborus/challenge/widget/questions_section.dart';
import 'package:laborus_app/pages/mobile/scLaborus/challenge/widget/ranking_widget.dart';
import 'package:laborus_app/pages/mobile/scLaborus/challenge/widget/statics_section.dart';

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          top: MediaQuery.of(context).padding.top,
        ),
        child: const Column(
          children: [
            SizedBox(height: 1),
            RankingWidget(),
            SizedBox(height: 8),
            FilterSection(),
            SizedBox(height: 8),
            StaticsSection(),
            SizedBox(height: 8),
            QuestionsSection(),
          ],
        ),
      ),
    );
  }
}
