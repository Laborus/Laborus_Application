import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        cursorColor: Theme.of(context).colorScheme.secondary,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.secondary,
          ),
          hintText: 'Digite alguma coisa...',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        ),
      ),
    );
  }
}
