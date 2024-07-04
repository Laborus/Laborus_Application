import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/components/navigation/custom_app_bar_introduction.dart';
import 'package:laborus_app/pages/mobile/scAuth/timeline/components/time_line_tile_component.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarIntroduction(
        title: 'Crie sua conta',
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Text(
              'Crie sua conta: Estudante',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),
            const SizedBox(height: 20),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 19),
              shrinkWrap: true,
              children: const [
                TimeLineTileComponent(
                  isFirst: true,
                  isLast: false,
                  isPast: true,
                  icon: Icons.person,
                  index: 1,
                  label: 'Dados obrigatórios',
                ),
                TimeLineTileComponent(
                  isFirst: false,
                  isLast: false,
                  isPast: true,
                  icon: Icons.location_on,
                  index: 2,
                  label: 'Localização e Instituição',
                ),
                TimeLineTileComponent(
                  isFirst: false,
                  isLast: false,
                  isPast: true,
                  icon: Icons.description,
                  index: 3,
                  label: 'Política de Privacidade',
                ),
                TimeLineTileComponent(
                  isFirst: false,
                  isLast: true,
                  isPast: false,
                  icon: Icons.mail,
                  index: 4,
                  label: 'Verificar E-mail',
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.goNamed('signinStep1');
              },
              child: const SizedBox(
                width: double.infinity,
                child: Text(
                  'Próximo',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
