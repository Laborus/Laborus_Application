import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/components/generics/avatar_picture.dart';
import 'package:laborus_app/core/components/modals/profile_modal.dart';
import 'package:laborus_app/core/routes/app_route_enum.dart';
import 'package:laborus_app/core/routes/go_router_prevent_duplicate.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  const CustomAppBar({super.key, required this.context});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      scrolledUnderElevation: 0,
      foregroundColor: Theme.of(context).colorScheme.primary,
      toolbarHeight: preferredSize.height,
      leadingWidth: double.infinity,
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
          onPressed: () {
            AppRouteEnum pathName = AppRouteEnum.notification;
            GoRouter.of(context).pushIfNotCurrent(context, pathName.name);
          },
          icon: badges.Badge(
            position: badges.BadgePosition.topStart(top: 2, start: 1),
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              badgeColor: AppColors.primaryPurple,
              padding: const EdgeInsets.all(6),
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            child: Icon(
              Icons.notifications_outlined,
              size: 26,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
        const SizedBox(width: 5),
        AvatarPicture(
          size: 40,
          imagePath: 'assets/img/profile.jpg',
          onTap: () => ProfileModal.show(context),
        )
      ],
    );
  }

  GestureDetector logo() {
    return GestureDetector(
      onTap: () {
        AppRouteEnum pathName = AppRouteEnum.home;
        GoRouter.of(context).goNavigate(context, pathName.name);
      },
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
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
