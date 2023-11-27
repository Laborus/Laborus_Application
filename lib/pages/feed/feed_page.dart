import 'package:flutter/material.dart';
import 'package:laborus_app/components/post_card.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<PalletTheme>(context).neutral200,
      child: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 120),
        child: Column(
          children: [PostWidget(), PostWidget()],
        ),
      ),
    );
  }
}
