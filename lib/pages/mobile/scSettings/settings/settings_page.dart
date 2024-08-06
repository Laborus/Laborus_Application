import 'package:flutter/material.dart';
import 'package:laborus_app/core/data/global_vars.dart';
import 'package:laborus_app/pages/mobile/scSettings/settings/components/option.dart';
import 'package:laborus_app/pages/mobile/scSettings/settings/components/profile_box.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      height: double.infinity,
      color: Theme.of(context).colorScheme.onPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 2,
          ),
          ProfileBox(),
          const SizedBox(
            height: 2,
          ),
          const Column(
            children: [
              Option(
                icon: Icons.wb_sunny_outlined,
                text: 'Aparência',
                isSwitch: true,
                isThemeSwitch: true,
              ),
              Option(
                icon: Icons.notifications_on_outlined,
                text: 'Notificações',
                isSwitch: true,
                isThemeSwitch: false,
              ),
              Option(
                icon: Icons.gpp_maybe_outlined,
                text: 'Política de Privacidade',
                isSwitch: false,
              ),
              Option(
                icon: Icons.description_outlined,
                text: 'Termos de Uso',
                isSwitch: false,
              ),
              Option(
                icon: Icons.help_outline,
                text: 'Ajuda & Suporte',
                isSwitch: false,
              ),
              Option(
                icon: Icons.smartphone_rounded,
                text: 'Versão ${AppGlobals.versionApp}',
                isSwitch: false,
              ),
              Option(
                icon: Icons.logout_rounded,
                text: 'Sair da Conta',
                isSwitch: false,
                isSignOut: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
