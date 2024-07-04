import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/cards/post_card.dart';
import 'package:laborus_app/core/data/data_post.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30, top: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              itemCount: posts.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return PostWidget(post: posts[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 13);
              },
            ),
          ],
        ),
      ),
    );
  }
}
