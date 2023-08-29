import 'package:flutter/material.dart';
import 'package:laborus_app/pages/chat/data/DUMMY_DATA.dart';
import 'package:laborus_app/pages/chat/model/people.dart';
import 'package:laborus_app/pages/chat/view/widgets/person_item.dart';

class PersonList extends StatelessWidget {
  const PersonList({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: height * 1,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: peoples.length,
          itemBuilder: (context, index) {
            final People people = peoples[index];
            return PersonItem(people: people);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        ),
      ),
    );
  }
}
