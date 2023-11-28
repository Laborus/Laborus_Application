import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/pages/signin/steps/widgets/custom_text_field.dart';
import 'package:laborus_app/providers/step_provide.dart';
import 'package:provider/provider.dart';

class StepPage2 extends StatelessWidget {
  const StepPage2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StepProvider>(context, listen: false)
          .changeText('Localização e Instituição');
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
                  labelText: 'Localização',
                  hintText: 'Cidade - UF',
                ),
                SizedBox(height: 12),
                CustomTextField(
                  labelText: 'Instituição',
                  hintText: 'Ex.: Fatec Carapicuíba',
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Provider.of<StepProvider>(context, listen: false).addData();
                context.goNamed('signinStep3');
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
