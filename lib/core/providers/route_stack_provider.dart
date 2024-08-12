import 'package:flutter/material.dart';

class RouteStackProvider with ChangeNotifier {
  final List<String> _routeStack = [];
  final int _maxStackSize;

  RouteStackProvider({int maxStackSize = 10}) : _maxStackSize = maxStackSize;

  List<String> get routeStack => List.unmodifiable(_routeStack);

  void pushRoute(String path) {
    if (_routeStack.isEmpty || _routeStack.last != path) {
      if (_routeStack.length >= _maxStackSize) {
        _clearAndRetainLast();
      }
      _routeStack.add(path);
      notifyListeners();
    }
  }

  void popRoute() {
    if (_routeStack.isNotEmpty) {
      _routeStack.removeLast();
      notifyListeners();
    }
  }

  void clearStackAndNavigate(String path) {
    _routeStack.clear();
    _routeStack.add(path);
    notifyListeners();
  }

  bool isCurrentRoute(String path) {
    return _routeStack.isNotEmpty && _routeStack.last == path;
  }

  void _clearAndRetainLast() {
    if (_routeStack.isNotEmpty) {
      final lastRoute = _routeStack.last;
      _routeStack.clear();
      _routeStack.add(lastRoute);
    }
  }
}
