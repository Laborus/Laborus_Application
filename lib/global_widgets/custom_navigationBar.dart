import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 80,
      shape: const CircularNotchedRectangle(),
      color: const Color.fromRGBO(30, 30, 30, 1),
      child: IconTheme(
        data: const IconThemeData(
          color: Color.fromRGBO(30, 30, 30, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavigationButton(
                context: context,
                icon: Icons.home,
                label: 'Home',
                route: 'feed',
              ),
              buildNavigationButton(
                context: context,
                icon: Icons.work,
                label: 'Vagas',
                route: null,
              ),
              const SizedBox(width: 30),
              buildNavigationButton(
                context: context,
                icon: Icons.message,
                label: 'Mensagens',
                route: 'chat',
              ),
              buildNavigationButton(
                context: context,
                icon: Icons.settings,
                label: 'Config',
                route: null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextButton buildNavigationButton({
    required IconData icon,
    required String label,
    required BuildContext context,
    String? route,
  }) {
    return TextButton(
      onPressed: () {
        if (route != null) {
          context.goNamed(route);
        }
      },
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
