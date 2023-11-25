import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/data/local_database.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  void checkOnboarding() async {
    final onboardingShown = await LocalDatabase.isOnboardingShown();
    if (onboardingShown) {
      // ignore: use_build_context_synchronously
      context.goNamed('welcome');
    } else {
      // ignore: use_build_context_synchronously
      context.goNamed('onboarding');
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      checkOnboarding();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(158, 0, 255, 1),
            Color.fromRGBO(112, 0, 181, 1)
          ],
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/img/laborus_light.png',
          width: 123,
          height: 123,
        ),
      ),
    );
  }
}
