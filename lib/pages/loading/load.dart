import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      context.goNamed('welcome');
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
