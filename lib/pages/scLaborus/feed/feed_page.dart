import 'package:flutter/material.dart';
import 'package:laborus_app/components/cards/post_card.dart';
import 'package:laborus_app/data/data_post.dart';
import 'package:laborus_app/pages/scLaborus/feed/components/custom_icon_button.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<PalletTheme>(context).neutral200,
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
