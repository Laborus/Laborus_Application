import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/components/generics/double_back_to_close.dart';
import 'package:laborus_app/components/navigation/custom_appBar.dart';
import 'package:laborus_app/components/navigation/custom_navigationBar.dart';

class HomeTemplate extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeTemplate({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return DoubleBackToCloseWidget(
      child: Scaffold(
        primary: true,
        appBar: CustomAppBar(
          context: context,
        ),
        body: navigationShell,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            context.goNamed('create');
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        bottomNavigationBar: const CustomBottomAppBar(),
      ),
    );
  }
}
