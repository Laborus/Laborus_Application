import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/chips/edit_tags.dart';
import 'package:laborus_app/core/components/chips/profile_tag.dart';

class TagsSection extends StatelessWidget {
  const TagsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfileTag(),
          SizedBox(width: 5),
          EditTags(),
        ],
      ),
    );
  }
}
