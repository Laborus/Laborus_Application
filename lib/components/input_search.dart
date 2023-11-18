import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  final double margin;
  const InputSearch({super.key, required this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: margin),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(220, 222, 231, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: const Color.fromRGBO(161, 172, 179, 1),
                decoration: const InputDecoration(
                  hintText: 'Digite alguma coisa...',
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                ),
              ),
            ),
            const Icon(
              Icons.search,
              color: Color.fromRGBO(161, 172, 179, 1),
            ),
            const SizedBox(width: 8)
          ],
        ),
      ),
    );
  }
}
