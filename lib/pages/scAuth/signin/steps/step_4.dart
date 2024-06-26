import 'package:flutter/material.dart';
import 'package:laborus_app/providers/step_provide.dart';
import 'package:provider/provider.dart';

class StepPage4 extends StatelessWidget {
  const StepPage4({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StepProvider>(context, listen: false)
          .changeText('Verificar E-mail');
    });
    return const Text('acabou');
  }
}
