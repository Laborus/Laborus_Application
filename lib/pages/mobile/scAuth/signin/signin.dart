import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/components/forms/text_field_form.dart';
import 'package:laborus_app/core/components/navigation/custom_app_bar_introduction.dart';
import 'package:laborus_app/core/routes/app_route_enum.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: CustomAppBarIntroduction(
        title: 'Entre com sua conta',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextSection(context),
            const SizedBox(height: 20),
            const Column(
              children: [
                CustomTextField(
                  labelText: 'Seu e-mail',
                  hintText: 'Digite seu e-mail',
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Digite seu e-mail',
                  labelText: 'Sua senha',
                  suffixIcon: Icon(Icons.visibility),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                AppRouteEnum currentPath = AppRouteEnum.home;
                String routePath = currentPath.name;
                context.goNamed(routePath);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Esqueceu a senha?',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onTertiary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                TextButton(
                  onPressed: () {
                    AppRouteEnum currentPath = AppRouteEnum.signin;
                    String routePath = currentPath.name;
                    context.pushReplacementNamed(routePath);
                  },
                  child: Text(
                    'Altere aqui.',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.mediumPurple,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextSection(BuildContext context) {
  return Column(
    children: [
      Text(
        'Bem-vindo(a) de volta!',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
      ),
      const SizedBox(height: 13),
      SizedBox(
        width: 260,
        child: Text(
          'É bom vê-lo(a) novamente! Por favor digite suas informações.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.tertiary,
              ),
        ),
      ),
    ],
  );
}
