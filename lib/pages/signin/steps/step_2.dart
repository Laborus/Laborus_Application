import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/pages/signin/steps/widgets/custom_text_field.dart';
import 'package:laborus_app/providers/step_provide.dart';
import 'package:provider/provider.dart';

class StepPage2 extends StatelessWidget {
  StepPage2({super.key});

  // Lista de estados brasileiros
  final List<String> estadosBrasileiros = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO'
  ];

  // Lista de Fatecs em Carapicuíba
  final List<String> fatecsCarapicuiba = [
    'Fatec Carapicuíba',
    // Adicione outras Fatecs se necessário
  ];

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
            Column(
              children: [
                // Dropdown para estados brasileiros
                DropdownButtonFormField<String>(
                  hint: Text('Selecione o estado'),
                  value: null, // Você pode definir um estado padrão se desejar
                  items: estadosBrasileiros.map((estado) {
                    return DropdownMenuItem<String>(
                      value: estado,
                      child: Text(estado),
                    );
                  }).toList(),
                  onChanged: (selectedEstado) {
                    // Faça algo com o estado selecionado
                  },
                ),
                SizedBox(height: 12),
                // Dropdown para Fatecs em Carapicuíba
                DropdownButtonFormField<String>(
                  hint: Text('Selecione a Fatec'),
                  value: null, // Você pode definir uma Fatec padrão se desejar
                  items: fatecsCarapicuiba.map((fatec) {
                    return DropdownMenuItem<String>(
                      value: fatec,
                      child: Text(fatec),
                    );
                  }).toList(),
                  onChanged: (selectedFatec) {
                    // Faça algo com a Fatec selecionada
                  },
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
