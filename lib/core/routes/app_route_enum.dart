enum AppRouteEnum {
  welcome,
  signin,
  signup,
  home,
  onboarding,
  settings,
  chat,
  profile,
  connections,
}

extension AppRouteExtension on AppRouteEnum {
  String get name {
    switch (this) {
      case AppRouteEnum.onboarding:
        return "/onboarding";
      case AppRouteEnum.welcome:
        return "/welcome";
      case AppRouteEnum.signin:
        return "/signin";
      case AppRouteEnum.signup:
        return "/signup";
      case AppRouteEnum.home:
        return "/home";
      case AppRouteEnum.chat:
        return "/chat";
      case AppRouteEnum.settings:
        return "/settings";
      case AppRouteEnum.profile:
        return "/profile";
      case AppRouteEnum.connections:
        return "/connections";
      default:
        return "/";
    }
  }
}
