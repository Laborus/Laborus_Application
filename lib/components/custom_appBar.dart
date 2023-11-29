import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:go_router/go_router.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  const CustomAppBar({super.key, required this.context});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Provider.of<PalletTheme>(context).neutral0,
      toolbarHeight: preferredSize.height,
      leadingWidth: double.infinity,
      forceMaterialTransparency: true,
      elevation: 0,
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
                color: Provider.of<PalletTheme>(context).neutral800,
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
            color: Provider.of<PalletTheme>(context).logo,
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
