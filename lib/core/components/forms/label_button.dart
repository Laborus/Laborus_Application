import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  const LabelButton({super.key, required this.label, required this.checked});
  final String label;
  final bool checked;
  @override
  Widget build(BuildContext context) {
    if (checked) {
      return InkWell(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
            child: Text(
              label,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                color: checked
                    ? Colors.white
                    : Theme.of(context).colorScheme.onTertiary,
              ),
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
                width: 1.75,
                style: BorderStyle.solid,
                color: Theme.of(context).colorScheme.primary,
                strokeAlign: BorderSide.strokeAlignCenter),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
            child: Text(
              label,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                color: checked
                    ? Colors.white
                    : Theme.of(context).colorScheme.onTertiary,
              ),
            ),
          ),
        ),
      );
    }
  }
}
