import 'dart:async';
import 'package:flutter/material.dart';
import 'package:laborus_app/pages/home/home.dart';

class Load extends StatefulWidget {
  const Load({super.key});

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 6), () {
      // Vai para outra tela.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
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
            'assets/images/laborus.png',
            width: 123,
            height: 123,
          ),
        ),
      );
  }
}