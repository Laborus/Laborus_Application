import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/utils/constants/colors.dart';

Widget buildBottomButtons(double width, BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      color: AppColors.darknessPurple,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 22,
      vertical: 49,
    ),
    width: width,
    child: Column(
      children: [
        ElevatedButton(
          onPressed: () => {},
          style: ButtonStyle(
            backgroundColor:
                Theme.of(context).elevatedButtonTheme.style?.foregroundColor,
            foregroundColor:
                const MaterialStatePropertyAll(AppColors.darknessPurple),
          ),
          child: const SizedBox(
            width: double.infinity,
            child: Text(
              'Fazer Login',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 24),
        OutlinedButton(
          onPressed: () => {context.goNamed('signin')},
          child: const SizedBox(
            width: double.infinity,
            child: Text(
              'Criar Conta',
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    ),
  );
}
