import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:laborus_app/core/providers/route_stack_provider.dart';

extension GoRouterPreventDuplicate on GoRouter {
  void pushIfNotCurrent(BuildContext context, String path) {
    final routeStackProvider = context.read<RouteStackProvider>();

    if (routeStackProvider.routeStack.isEmpty ||
        !routeStackProvider.isCurrentRoute(path)) {
      debugPrint(
          'Navegando para $path, atual: ${routeStackProvider.routeStack.isEmpty ? 'Nenhum' : routeStackProvider.routeStack.last}');
      routeStackProvider.pushRoute(path);
      push(path);
    } else {
      debugPrint(
          'Tentativa de navegar para $path ignorada, já é a rota atual.');
    }
  }

  void goNavigate(BuildContext context, String path) {
    final routeStackProvider = context.read<RouteStackProvider>();
    if (routeStackProvider.routeStack.isEmpty ||
        !routeStackProvider.isCurrentRoute(path)) {
      debugPrint(
          'Navegando para $path, atual: ${routeStackProvider.routeStack.isEmpty ? 'Nenhum' : routeStackProvider.routeStack.last}');
      routeStackProvider.pushRoute(path);
      go(path);
    } else {
      debugPrint(
          'Tentativa de navegar para $path ignorada, já é a rota atual.');
    }
  }

  void clearStackAndNavigate(BuildContext context, String path) {
    final routeStackProvider = context.read<RouteStackProvider>();
    while (canPop()) {
      popAndNavigate(context);
    }
    routeStackProvider.clearStackAndNavigate(path);
    pushReplacement(path);
  }

  void popAndNavigate(BuildContext context) {
    final routeStackProvider = context.read<RouteStackProvider>();

    if (routeStackProvider.routeStack.isNotEmpty) {
      routeStackProvider.popRoute();
    }
    routerDelegate.popRoute();
  }
}
