import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/forms/text_field_form.dart';

class LocationFieldsStep extends StatelessWidget {
  const LocationFieldsStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Forneça sua localização',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.onTertiary,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          'Por favor, preencha os campos abaixo para criar sua conta.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onTertiary,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          labelText: 'CEP',
          hintText: '000000-00',
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          labelText: 'Endereço',
          hintText: '000000-00',
          enabled: false,
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          labelText: 'Número da residência',
          hintText: '000',
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          labelText: 'Estado',
          hintText: 'SP',
          enabled: false,
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          labelText: 'Cidade',
          hintText: 'Guarulhos',
          enabled: false,
        ),
      ],
    );
  }
}
