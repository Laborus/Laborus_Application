import 'package:flutter/material.dart';
import 'package:laborus_app/pages/mobile/scSettings/settings/components/option.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Theme.of(context).colorScheme.onPrimary,
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
              color: Theme.of(context).colorScheme.secondary,
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
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child:
                const Option(icon: Icons.logout, text: 'Sair', isSwitch: false),
          )
        ],
      ),
    );
  }
}
