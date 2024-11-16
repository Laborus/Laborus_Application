import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class CustomDropdownButtonFormField<T> extends StatelessWidget {
  final String labelText;
  final String hintText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? errorText;
  final bool enabled;

  const CustomDropdownButtonFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.errorText,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onTertiary,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<T>(
          value: value,
          decoration: InputDecoration(
            labelText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: enabled
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
            filled: !enabled,
            fillColor: !enabled ? Theme.of(context).colorScheme.tertiary : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                width: 1.5,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                width: 1.5,
                color: AppColors.darknessPurple,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                width: 1.5,
                color: AppColors.red,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                width: 1.5,
                color: AppColors.red,
              ),
            ),
            errorText: errorText,
            errorStyle: const TextStyle(
              color: AppColors.red,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                width: 1.5,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
          items: items,
          onChanged: enabled ? onChanged : null,
          dropdownColor: Theme.of(context).colorScheme.surface,
        ),
      ],
    );
  }
}
