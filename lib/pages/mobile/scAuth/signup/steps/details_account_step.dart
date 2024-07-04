import 'package:flutter/material.dart';
import 'package:laborus_app/core/components/forms/text_field_form.dart';

class DetailsAccountStep extends StatelessWidget {
  const DetailsAccountStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Dados obrigatórios',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.onTertiary,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          'Por favor, preencha os campos com suas informações pessoais.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onTertiary,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          labelText: 'Nome',
          hintText: 'Nome Completo',
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          labelText: 'CPF',
          hintText: '000.000.000-00',
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          labelText: 'Email',
          hintText: 'exemplo@gmail.com',
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          labelText: 'Senha',
          hintText: 'Sua senha',
          obscureText: true,
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            onPressed: null,
          ),
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          labelText: 'Confirme sua senha',
          hintText: 'Sua senha',
          obscureText: true,
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            onPressed: null,
          ),
        ),
      ],
    );
  }
}
