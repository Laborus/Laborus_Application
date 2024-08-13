import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/generics/avatar_picture.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class InstitutionInfo extends StatelessWidget {
  final String institutionName;
  final String location;
  final String students;
  final String onlineStudents;

  const InstitutionInfo({
    Key? key,
    required this.institutionName,
    required this.location,
    required this.students,
    required this.onlineStudents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AvatarPicture(
            imagePath: 'assets/img/profile.jpg',
            size: 50,
          ),
          const SizedBox(width: 13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                institutionName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    size: 14,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.school_outlined,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        size: 14,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '$students alunos',
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: AppColors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '$onlineStudents on-line',
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
