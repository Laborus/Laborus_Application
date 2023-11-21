import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  const CustomAppBar({super.key, required this.context});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      leadingWidth: double.infinity,
      forceMaterialTransparency: true,
      leading: Container(
        margin: const EdgeInsets.only(left: 22, right: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            logo(),
            actions(),
          ],
        ),
      ),
    );
  }

  Row actions() {
    return Row(
      children: [
        IconButton(
          onPressed: () => context.goNamed('notification'),
          icon: badges.Badge(
            position: badges.BadgePosition.topStart(top: 2, start: 1),
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              badgeColor: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.all(6),
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(context).appBarTheme!.backgroundColor ??
                    const Color.fromRGBO(30, 30, 30, 1),
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.notifications_outlined,
              size: 26,
            ),
          ),
        ),
        TextButton(
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/img/profile.jpg'),
            radius: 20,
          ),
          onPressed: () => context.goNamed('profile'),
        )
      ],
    );
  }

  GestureDetector logo() {
    return GestureDetector(
      onTap: () => context.goNamed('feed'),
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          'assets/img/appLogo.png',
          width: 35,
          height: 35,
        ),
      ),
    );
  }
}
