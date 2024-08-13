import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/routes/app_route_enum.dart';
import 'package:laborus_app/core/routes/go_router_prevent_duplicate.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 21,
        right: 21,
        bottom: 32,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.darknessPurple.withOpacity(0.1),
                  offset: const Offset(0, 4),
                  blurRadius: 32,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(22)),
              child: Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  enableFeedback: false,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  onTap: (index) {
                    switch (index) {
                      case 0:
                        AppRouteEnum path = AppRouteEnum.home;
                        GoRouter.of(context).goNavigate(context, path.name);
                        break;
                      case 1:
                        AppRouteEnum path = AppRouteEnum.connections;
                        GoRouter.of(context).goNavigate(context, path.name);
                        break;
                      case 2:
                        break;
                      case 3:
                        AppRouteEnum path = AppRouteEnum.job;
                        GoRouter.of(context).goNavigate(context, path.name);
                        break;
                      case 4:
                        AppRouteEnum path = AppRouteEnum.chat;
                        GoRouter.of(context).goNavigate(context, path.name);
                        break;
                    }
                  },
                  items: [
                    buildBottomNavItem(
                      icon: Icons.home_outlined,
                      label: 'Início',
                      context: context,
                      padding: const EdgeInsets.only(left: 5),
                    ),
                    buildBottomNavItem(
                      icon: Icons.people_outline,
                      label: 'Conexões',
                      context: context,
                    ),
                    buildBottomNavItem(label: '', context: context),
                    buildBottomNavItem(
                      icon: Icons.work_outline,
                      label: 'Vagas',
                      context: context,
                    ),
                    buildBottomNavItem(
                      icon: Icons.chat_bubble_outline,
                      label: 'Conversas',
                      context: context,
                      padding: const EdgeInsets.only(right: 5),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            bottom: 12,
            top: 12,
            child: Align(
              alignment: Alignment.center,
              child: FloatingActionButton(
                enableFeedback: false,
                elevation: 0,
                shape: const CircleBorder(),
                onPressed: () {
                  GoRouter.of(context).pushIfNotCurrent(context, '/create');
                },
                backgroundColor: AppColors.primaryPurple,
                child: Icon(
                  Icons.add_rounded,
                  size: 35,
                  color: AppColors.neutralsLight[0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavItem(
      {IconData? icon,
      required String label,
      required BuildContext context,
      EdgeInsets? padding}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.home,
              size: 24,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.w800,
              ).copyWith(
                fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
              ),
            )
          ],
        ),
      ),
      label: '',
    );
  }
}
