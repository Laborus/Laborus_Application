import 'package:flutter/material.dart';
import 'package:laborus_app/components/post_card.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 80),
      child: Column(
        children: [post(context), post(context)],
      ),
    );
  }
}
