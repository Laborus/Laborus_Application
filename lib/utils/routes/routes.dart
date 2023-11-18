import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/pages/chat/chat_page.dart';
import 'package:laborus_app/pages/feed/feed_page.dart';
import 'package:laborus_app/pages/loading/load.dart';
import 'package:laborus_app/pages/notification/notification_view.dart';
import 'package:laborus_app/pages/profile/profile.dart';
import 'package:laborus_app/pages/settings/settings_page.dart';
import 'package:laborus_app/pages/template/home_template.dart';
import 'package:laborus_app/pages/welcome/welcome_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _feedNavigatorKey = GlobalKey<NavigatorState>();
final _messageNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'start',
      path: '/',
      builder: (context, state) => const LoadPage(),
    ),
    GoRoute(
      name: 'welcome',
      path: '/welcome',
      builder: (context, state) => const WelcomePage(),
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
              builder: (context, state) => const FeedPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _messageNavigatorKey,
          routes: [
            GoRoute(
              path: '/chat',
              name: 'chat',
              builder: (context, state) => const ChatPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsNavigatorKey,
          routes: [
            GoRoute(
              path: '/settings',
              name: 'settings',
              builder: (context, state) => SettingsPage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/home/profile',
      name: 'profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/home/notification',
      name: 'notification',
      builder: (context, state) => const NotificationPage(),
    ),
  ],
);

get router => _router;
