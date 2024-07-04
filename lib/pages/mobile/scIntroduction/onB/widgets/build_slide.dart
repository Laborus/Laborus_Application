import 'package:flutter/material.dart';

Widget buildContainer(String urlImage, String title, Widget label, int index,
        BuildContext ctx) =>
    SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset(urlImage, fit: BoxFit.cover),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'Inter'),
          ),
          const SizedBox(height: 20),
          label
        ],
      ),
    );
