import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).colorScheme.tertiaryContainer,
      style: TextStyle(
        color: Theme.of(context).colorScheme.tertiaryContainer,
      ),
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.onPrimary,
        filled: true, // This makes the TextField filled with color
        suffixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.tertiaryContainer,
        ),
        hintText: 'Digite alguma coisa...',
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.tertiaryContainer,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
