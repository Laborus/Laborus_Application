import 'package:flutter/material.dart';

class Home extends StatelessWidget {
const Home({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(158, 0, 255, 1), Color.fromRGBO(112, 0, 181, 1)],
          ),
        ),
        child: Center(
          child:
            Image.asset(
              'assets/images/laborus.png',
              width: 123,
              height: 123,
              ),
        ),
      ),
    );
}
}