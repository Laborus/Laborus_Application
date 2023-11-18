import 'package:flutter/material.dart';
import 'package:laborus_app/pages/chat/data/DUMMY_DATA.dart';
import 'package:laborus_app/pages/chat/widgets/group_item.dart';

class GroupList extends StatelessWidget {
  const GroupList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const GroupItem(image: ''),
            const SizedBox(width: 10),
            ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GroupItem(image: groups[index].image);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: groups.length),
          ],
        ),
      ),
    );
  }
}
