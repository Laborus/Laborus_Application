import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/utils/constants/colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTextSection(context),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 22,
                child: const Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        label: Text('Seu e-mail'),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        label: Text('Seu senha'),
                        suffixIcon: Icon(Icons.visibility),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('feed');
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 22,
                  child: const Text(
                    'Entrar',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text.rich(
                TextSpan(
                  text: 'Esqueceu a senha? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onTertiary,
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    fontWeight: FontWeight.w300,
                  ),
                  children: [
                    TextSpan(
                      text: 'Altere aqui.',
                      style: TextStyle(
                        color: AppColors.darknessPurple,
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium?.fontSize,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

Widget buildTextSection(BuildContext context) {
  return Column(
    children: [
      Text(
        'Escolha sua conta',
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: 260,
        child: Text(
          'Selecione a opção que corresponde a sua necessidade:',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
            fontWeight: FontWeight.w200,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
      ),
    ],
  );
}
