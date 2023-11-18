import 'package:flutter/material.dart';
import 'package:laborus_app/global_widgets/post_card.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 80),
      child: Column(
        children: [post(context), post(context)],
      ),
    );
  }
}
