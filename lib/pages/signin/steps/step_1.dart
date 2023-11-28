import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/pages/signin/steps/widgets/custom_text_field.dart';
import 'package:laborus_app/providers/step_provide.dart';
import 'package:provider/provider.dart';

class StepPage1 extends StatelessWidget {
  const StepPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StepProvider>(context, listen: false)
          .changeText('Dados obrigatórios');
    });

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                CustomTextField(
                  labelText: 'Nome',
                  hintText: 'Usuário',
                ),
                SizedBox(height: 12),
                CustomTextField(
                  labelText: 'CPF',
                  hintText: '123.456.789-00',
                ),
                SizedBox(height: 12),
                CustomTextField(
                  labelText: 'E-mail',
                  hintText: 'exemplo@email.com',
                ),
                SizedBox(height: 12),
                CustomTextField(
                  labelText: 'Senha',
                  hintText: '********',
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Provider.of<StepProvider>(context, listen: false).addData();
                context.goNamed('signinStep2');
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text('Proximo'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
