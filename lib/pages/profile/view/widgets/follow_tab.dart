import 'package:flutter/material.dart';
import 'package:laborus_app/global_widgets/label_button.dart';
import 'package:laborus_app/utils/constants.dart';

class FollowTab extends StatelessWidget {
  const FollowTab({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 1,
      alignment: Alignment.bottomLeft,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 34, horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                LabelButton(checked: true, label: 'Todas'),
                SizedBox(width: 13),
                LabelButton(checked: false, label: 'Favoritos'),
              ],
            ),
            SizedBox(height: 21),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ProfileTile(), ProfileTile()],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 13),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/img/profile.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(width: 21),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fatec Carapicuíba',
                style: font(Theme.of(context).appBarTheme.foregroundColor,
                        FontWeight.w500)
                    .titleSmall,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 3),
              Text(
                'Ensino Superior',
                style: font(Theme.of(context).appBarTheme.foregroundColor,
                        FontWeight.w400)
                    .bodySmall,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ],
      ),
    );
  }
}
