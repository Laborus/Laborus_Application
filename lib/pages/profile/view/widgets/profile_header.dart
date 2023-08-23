import 'package:flutter/material.dart';
import 'package:laborus_app/utils/constants.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              height: 162,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/profile_banner.png'),
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
            ),
            Positioned(
              top: 15,
              left: 8,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 25,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
        Container(
          margin:
              const EdgeInsets.symmetric(horizontal: 21, vertical: 13),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/img/profile.jpg'),
                      ),
                      const SizedBox(width: 13),
                      Text(
                        'Stefan Horvath',
                        style: font(
                                Theme.of(context)
                                    .appBarTheme
                                    .foregroundColor,
                                FontWeight.w700)
                            .headlineSmall,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.people,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 21),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.map_sharp),
                        SizedBox(width: 5),
                        Text('Osasco'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.corporate_fare),
                        SizedBox(width: 5),
                        Text('Fatec Carapicuiba'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],

    );
  }
}
