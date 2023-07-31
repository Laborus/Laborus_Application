import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:laborus_app/utils/constants.dart';
import 'package:laborus_app/global_widgets/appBar.dart';
import 'package:laborus_app/global_widgets/navigationBar.dart';
import 'package:laborus_app/global_widgets/post_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    int i = 1;
    double? size = navigation().height;
    double height = size! + 30;

    return Scaffold(
      appBar: appbar(i, context),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: height),
        child: Column(
          children: [
            post(context),
            post(context)
          ],
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: navigation(),
    );
  }

 
}
