import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/routes/app_route_enum.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';

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
          onPressed: () {
            AppRouteEnum currentPath = AppRouteEnum.signin;
            String routePath = currentPath.name;
            context.pushNamed(routePath);
          },
          style: ButtonStyle(
            backgroundColor:
                Theme.of(context).elevatedButtonTheme.style?.foregroundColor,
            foregroundColor:
                const WidgetStatePropertyAll(AppColors.darknessPurple),
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
          onPressed: () {
            AppRouteEnum currentPath = AppRouteEnum.signup;
            String routePath = currentPath.name;
            context.pushNamed(routePath);
          },
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
