import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/utils/routes/global_routes.dart';
import 'package:laborus_app/core/utils/theme/custom/pallet_theme.dart';

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
                BorderSide(color: PalletTheme().neutral600, width: 2),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            onPressed: () {
              GlobalRouteStack.pop();
              String previousRoute = GlobalRouteStack.getPreviousRoute();

              context.goNamed(previousRoute);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: PalletTheme().neutral600,
            ),
          )
        ]),
        leadingWidth: double.infinity,
      ),
      backgroundColor: PalletTheme().neutral0,
      body: navigationShell,
    );
  }
}
