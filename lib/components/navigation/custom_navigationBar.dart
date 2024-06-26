import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/utils/constants/colors.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentRoute = GoRouterState.of(context).path ?? '';

    return BottomAppBar(
      elevation: 0,
      height: 80,
      shape: const CircularNotchedRectangle(),
      color: AppColors.neutralsLight[800],
      child: IconTheme(
        data: const IconThemeData(
          color: Color.fromRGBO(30, 30, 30, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavigationButton(
              context: context,
              icon: Icons.home,
              label: 'Home',
              route: '/feed',
              isSelected: currentRoute == '/feed',
            ),
            buildNavigationButton(
              context: context,
              icon: Icons.work,
              label: 'Vagas',
              route: null,
              isSelected: false,
            ),
            const SizedBox(width: 30),
            buildNavigationButton(
              context: context,
              icon: Icons.message,
              label: 'Mensagens',
              route: '/chat',
              isSelected: currentRoute == 'chat',
            ),
            buildNavigationButton(
              context: context,
              icon: Icons.settings,
              label: 'Config',
              route: '/settings',
              isSelected: currentRoute == '/settings',
            ),
          ],
        ),
      ),
    );
  }

  TextButton buildNavigationButton({
    required IconData icon,
    required String label,
    required BuildContext context,
    String? route,
    required bool isSelected,
  }) {
    return TextButton(
      onPressed: () {
        if (route != null) {
          GoRouter.of(context).go(route);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.white,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
