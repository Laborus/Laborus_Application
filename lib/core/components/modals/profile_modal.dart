import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/routes/app_route_enum.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';

class ProfileModal {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 22,
                left: 22,
                top: 13,
              ),
              child: GestureDetector(
                onTap: () {
                  AppRouteEnum path = AppRouteEnum.profile;
                  _navigateAndCloseModal(context, path);
                },
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img/profile.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(
                          Radius.circular(999),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Visualizar perfil',
                          style: TextStyle(
                            fontSize: AppFontSize.large,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                        Text(
                          'ana.maria@gmail.com',
                          style: TextStyle(
                            fontSize: AppFontSize.small,
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).colorScheme.tertiaryContainer,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: AppFontSize.xxLarge,
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            _buildMenuItem(
              context,
              icon: Icons.account_balance_outlined,
              label: 'Meu Campus',
              onTap: () {
                // Handle Meu Campus tap
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.outlined_flag_rounded,
              label: 'Desafios',
              onTap: () {
                // Handle Desafios tap
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.bookmark_outline_rounded,
              label: 'Salvos',
              onTap: () {},
            ),
            _buildMenuItem(
              context,
              icon: Icons.settings_outlined,
              label: 'Configurações',
              onTap: () {
                AppRouteEnum path = AppRouteEnum.settings;
                _navigateAndCloseModal(context, path);
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.logout,
              label: 'Sair da conta',
              textColor: AppColors.red,
              backgroundColor: AppColors.lightRed,
              onTap: () {
                AppRouteEnum path = AppRouteEnum.welcome;
                _navigateAndCloseModal(context, path);
              },
            ),
          ],
        );
      },
    );
  }

  static Widget _buildMenuItem(BuildContext context,
      {required IconData icon,
      required String label,
      Color? textColor,
      Color backgroundColor = AppColors.transparent,
      required VoidCallback onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 22, right: 22),
      tileColor: backgroundColor,
      leading: Icon(
        icon,
        color: textColor ?? Theme.of(context).colorScheme.onTertiary,
        size: AppFontSize.xxxLarge,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: textColor ?? Theme.of(context).colorScheme.onTertiary,
          fontSize: AppFontSize.medium,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }

  static void _navigateAndCloseModal(BuildContext context, AppRouteEnum route) {
    Navigator.pop(context); // Fecha o modal
    context.pushNamed(route.name); // Navega para a rota especificada
  }
}
