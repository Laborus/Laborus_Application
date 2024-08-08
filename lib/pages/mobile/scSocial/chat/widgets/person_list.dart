import 'package:flutter/material.dart';
import 'package:laborus_app/pages/mobile/scSocial/chat/data/dummy_data.dart';
import 'package:laborus_app/core/model/social/people.dart';
import 'package:laborus_app/core/components/tiles/person_tile.dart';

class PersonList extends StatelessWidget {
  const PersonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: peoples.length,
      itemBuilder: (context, index) {
        final People people = peoples[index];
        return PersonTile(people: people);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 1),
    );
  }
}
