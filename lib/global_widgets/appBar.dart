import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:laborus_app/utils/routes.dart';

AppBar appbar(int i, BuildContext context) {
  return AppBar(
    toolbarHeight: 40 + MediaQuery.of(context).padding.top,
    leadingWidth: double.infinity,
    elevation: 0,
    leading: Container(
      margin: const EdgeInsets.only(left: 0, right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          logo(),
          actions(i, context),
        ],
      ),
    ),
  );
}

Row actions(int i, BuildContext context) {
  return Row(
    children: [
      IconButton(
        onPressed: () {},
        icon: badges.Badge(
          showBadge: i > 0 ? true : false,
          position: badges.BadgePosition.topStart(top: 2, start: 1),
          badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.circle,
            badgeColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(6),
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Theme.of(context).appBarTheme.backgroundColor ??
                    const Color.fromRGBO(30, 30, 30, 1),
                width: 2),
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
          radius: 28,
        ),
        onPressed: () {
          // Vai para outra tela.
          Navigator.of(context).pushNamed(
            AppRoutes.profile,
          );
        },
      )
    ],
  );
}

TextButton logo() {
  return TextButton(
    onPressed: () {},
    child: Image.asset(
      'assets/img/laborus_dark.png',
      width: 40,
      height: 40,
    ),
  );
}
