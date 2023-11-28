import 'package:flutter/material.dart';
import 'package:laborus_app/pages/settings/components/option.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Provider.of<PalletTheme>(context).neutral200,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Geral',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Provider.of<PalletTheme>(context).neutral300,
            ),
            child: const Column(
              children: [
                Option(
                  icon: Icons.person,
                  text: 'Conta',
                  isSwitch: false,
                ),
                Option(
                  icon: Icons.description,
                  text: 'Termos & Privacidade',
                  isSwitch: false,
                ),
                Option(
                  icon: Icons.notifications,
                  text: 'Notificações',
                  isSwitch: false,
                ),
                Option(
                  icon: Icons.contrast,
                  text: 'Aparência',
                  isSwitch: true,
                ),
                Option(
                  icon: Icons.help,
                  text: 'FAQ & Suporte',
                  isSwitch: false,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Provider.of<PalletTheme>(context).neutral300,
            ),
            child: Option(icon: Icons.logout, text: 'Sair', isSwitch: false),
          )
        ],
      ),
    );
  }
}
