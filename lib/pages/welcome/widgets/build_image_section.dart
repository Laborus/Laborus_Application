import 'package:flutter/material.dart';

Widget buildImageSection(double width) {
  return Image.asset(
    'assets/img/welcome.png',
    alignment: Alignment.center,
    width: width * 0.8,
    fit: BoxFit.cover,
  );
}
