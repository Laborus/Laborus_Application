enum AppRouteEnum {
  welcome,
  signin,
  signup,
  home,
  onboarding,
  settings,
  chat,
  profile
}

extension AppRouteExtension on AppRouteEnum {
  String get name {
    switch (this) {
      case AppRouteEnum.onboarding:
        return "Onboarding";
      case AppRouteEnum.welcome:
        return "Welcome";
      case AppRouteEnum.signin:
        return "Signin";
      case AppRouteEnum.signup:
        return "Signup";
      case AppRouteEnum.home:
        return "Home";
      case AppRouteEnum.chat:
        return "Chat";
      case AppRouteEnum.settings:
        return "Settings";
      case AppRouteEnum.profile:
        return "Profile";
      default:
        return "/";
    }
  }
}
