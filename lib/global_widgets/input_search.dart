import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({super.key, required this.margin});
  final double margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: margin),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(220, 222, 231, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 11),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: Color.fromRGBO(161, 172, 179, 1),
                decoration: InputDecoration(
                  hintText: 'Digite alguma coisa...',
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                ),
              ),
            ),
            Icon(
              Icons.search,
              color: Color.fromRGBO(161, 172, 179, 1),
            ),
            SizedBox(width: 8)
          ],
        ),
      ),
    );
  }
}
