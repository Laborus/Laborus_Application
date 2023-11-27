import 'package:flutter/material.dart';
import 'package:laborus_app/pages/timeline/components/time_line_tile_component.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              color: Provider.of<PalletTheme>(context).neutral800,
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
            onPressed: () {},
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
    );
  }
}
