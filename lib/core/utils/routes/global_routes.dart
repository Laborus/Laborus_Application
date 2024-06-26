class GlobalRouteStack {
  static List<String> routeStack = [];

  static void push(String route) {
    routeStack.add(route);
  }

  static void pop() {
    if (routeStack.isNotEmpty) {
      routeStack.removeLast();
    }
  }

  static String getPreviousRoute() {
    if (routeStack.isNotEmpty) {
      return routeStack.last;
    }
    return 'feed';
  }
}
