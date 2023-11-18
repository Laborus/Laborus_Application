import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: unused_import
import 'package:laborus_app/utils/constants.dart';
import 'package:laborus_app/global_widgets/custom_appBar.dart';
import 'package:laborus_app/global_widgets/custom_navigationBar.dart';

class HomeTemplate extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeTemplate({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
      ),
      body: navigationShell,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
