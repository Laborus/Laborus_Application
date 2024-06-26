import 'package:flutter/material.dart';

Widget buildContinueButton(int activeIndex, List<String> urlImages,
    Function refresh, BuildContext context) {
  return ElevatedButton(
    onPressed: refresh(),
    child: Container(
      width: MediaQuery.of(context).size.width * .8,
      alignment: Alignment.center,
      child: const Text('Continuar'),
    ),
  );
}
