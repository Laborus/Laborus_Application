import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/pages/CYA/choose_your_account_page.dart';
import 'package:laborus_app/pages/chat/chat_page.dart';
import 'package:laborus_app/pages/feed/feed_page.dart';
import 'package:laborus_app/pages/loading/load.dart';
import 'package:laborus_app/pages/notification/notification_view.dart';
import 'package:laborus_app/pages/onB/onb_page.dart';
import 'package:laborus_app/pages/profile/profile.dart';
import 'package:laborus_app/pages/settings/settings_page.dart';
import 'package:laborus_app/pages/template/home_template.dart';
import 'package:laborus_app/pages/template/sign_template.dart';
import 'package:laborus_app/pages/timeline/timeline_page.dart';
import 'package:laborus_app/pages/welcome/welcome_page.dart';
import 'package:laborus_app/utils/routes/global_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _feedNavigatorKey = GlobalKey<NavigatorState>();
final _messageNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>();
final _siginNavigatorKey = GlobalKey<NavigatorState>();
final _infoNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'start',
      path: '/',
      builder: (context, state) {
        return const LoadPage();
      },
    ),
    GoRoute(
      name: 'onboarding',
      path: '/onboarding',
      builder: (context, state) {
        return const OnBoardingPage();
      },
    ),
    GoRoute(
      name: 'welcome',
      path: '/welcome',
      builder: (context, state) {
        GlobalRouteStack.push(state.name.toString());
        return const WelcomePage();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          SignTemplate(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _siginNavigatorKey,
          routes: [
            GoRoute(
              path: '/signin',
              name: 'signin',
              builder: (context, state) {
                GlobalRouteStack.push(state.name.toString());
                return const ChooseYourAccountPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _infoNavigatorKey,
          routes: [
            GoRoute(
              path: '/signin/info',
              name: 'info',
              builder: (context, state) {
                GlobalRouteStack.push(state.name.toString());
                return const TimelinePage();
              },
            )
          ],
        )
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeTemplate(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _feedNavigatorKey,
          routes: [
            GoRoute(
              path: '/feed',
              name: 'feed',
              builder: (context, state) {
                GlobalRouteStack.push(state.name.toString());
                return const FeedPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _messageNavigatorKey,
          routes: [
            GoRoute(
              path: '/chat',
              name: 'chat',
              builder: (context, state) {
                GlobalRouteStack.push(state.name.toString());
                return const ChatPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsNavigatorKey,
          routes: [
            GoRoute(
              path: '/settings',
              name: 'settings',
              builder: (context, state) {
                GlobalRouteStack.push(state.name.toString());
                return const SettingsPage();
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/home/profile',
      name: 'profile',
      builder: (context, state) {
        GlobalRouteStack.push(state.name.toString());
        return const ProfilePage();
      },
    ),
    GoRoute(
      path: '/home/notification',
      name: 'notification',
      builder: (context, state) {
        GlobalRouteStack.push(state.name.toString());
        return const NotificationPage();
      },
    ),
  ],
);

get router => _router;
