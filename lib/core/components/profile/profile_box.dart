import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/routes/app_route_enum.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
      color: Theme.of(context).colorScheme.primary,
      child: GestureDetector(
        onTap: () {
          AppRouteEnum path = AppRouteEnum.profile;
          context.pushReplacementNamed(path.name);
        },
        child: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/img/profile.jpg'),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ana Maria',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  'ana.maria@gmail.com',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
