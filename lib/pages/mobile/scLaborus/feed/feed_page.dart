import 'package:flutter/material.dart';
import 'package:laborus_app/components/cards/post_card.dart';
import 'package:laborus_app/core/data/data_post.dart';
import 'package:laborus_app/pages/mobile/scLaborus/feed/components/custom_icon_button.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40, top: 20),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomIconButton(
                  icon: Icons.messenger_outline_rounded,
                  routeName: '',
                ),
                CustomIconButton(
                  icon: Icons.people_outline_sharp,
                  routeName: '',
                ),
                CustomIconButton(
                  icon: Icons.school_outlined,
                  routeName: 'campus',
                ),
                CustomIconButton(
                  icon: Icons.emoji_events_outlined,
                  routeName: '',
                )
              ],
            ),
            ListView.builder(
              itemCount: posts.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return PostWidget(post: posts[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
