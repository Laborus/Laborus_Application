import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/components/generics/double_back_to_close.dart';
import 'package:laborus_app/core/components/navigation/custom_app_bar.dart';
import 'package:laborus_app/core/components/navigation/custom_navigation_bar.dart';

class HomeTemplate extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeTemplate({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return DoubleBackToCloseWidget(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          context: context,
        ),
        body: navigationShell,
        bottomNavigationBar: const CustomBottomAppBar(),
      ),
    );
  }
}
