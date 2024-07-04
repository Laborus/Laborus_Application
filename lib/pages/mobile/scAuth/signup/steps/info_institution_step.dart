import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/forms/text_field_form.dart';

class InfoInstitutionStep extends StatelessWidget {
  const InfoInstitutionStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Informações da Instituição',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.onTertiary,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          'Por favor, Precisamos de mais algumas informações para criar sua conta.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onTertiary,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          labelText: 'Instituição',
          hintText: 'Fatec Caralhos',
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          labelText: 'Superior, Modalidade ou Curso',
          hintText: 'ADS - Análise e Desenvolvimento de Sistemas',
          enabled: false,
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          labelText: 'Ciclo',
          hintText: '2',
        ),
      ],
    );
  }
}
