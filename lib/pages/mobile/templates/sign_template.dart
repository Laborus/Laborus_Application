import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignTemplate extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const SignTemplate({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        leading: Row(children: [
          const SizedBox(width: 22),
          IconButton.outlined(
            padding: const EdgeInsets.all(14),
            iconSize: 20,
            style: ButtonStyle(
              alignment: Alignment.center,
              side: WidgetStatePropertyAll(
                BorderSide(
                    color: Theme.of(context).colorScheme.tertiary, width: 2),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          )
        ]),
        leadingWidth: double.infinity,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: navigationShell,
    );
  }
}
