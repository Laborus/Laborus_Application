import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:laborus_app/core/utils/theme/font_size.dart';
import 'package:laborus_app/pages/mobile/scSocial/profile/widgets/section_content.dart';
import 'package:laborus_app/pages/mobile/scSocial/profile/widgets/section_tile.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(title: 'Sobre'),
                SizedBox(height: 8),
                SectionContent(
                  content:
                      'Arte é minha maior paixão, eu sou gamada em Fotografia e Design...Marketing também haha me adiciona ai para conversamos! Arte é minha maior paixão, eu sou gamada em Fotografia e Design...Marketing também haha me adiciona ai para conversamos! :)',
                ),
                SizedBox(height: 13),
                SectionTitle(title: 'Curso'),
                SizedBox(height: 8),
                SectionContent(
                  content: 'Análise e Desenvolvimento de Sistemas',
                ),
              ],
            ),
          ),
          Positioned(
            top: -5,
            right: -5,
            child: editButton(
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget editButton({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primaryPurple,
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Icon(
          Icons.edit_outlined,
          size: AppFontSize.medium,
          color: AppColors.neutralsDark[800]!,
        ),
      ),
    );
  }
}
