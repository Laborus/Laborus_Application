import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/model/laborus/post.dart';
import 'package:laborus_app/pages/mobile/scAuth/signin/signin.dart';
import 'package:laborus_app/pages/mobile/scSocial/chat/chat_page.dart';
import 'package:laborus_app/pages/mobile/scLaborus/create_post/create_post_page.dart';
import 'package:laborus_app/pages/mobile/scLaborus/feed/feed_page.dart';
import 'package:laborus_app/pages/mobile/scSocial/notification/notification_view.dart';
import 'package:laborus_app/pages/mobile/scIntroduction/onB/onb_page.dart';
import 'package:laborus_app/pages/mobile/scLaborus/post_full_size/post_full_size_page.dart';
import 'package:laborus_app/pages/mobile/scSocial/profile/profile.dart';
import 'package:laborus_app/pages/mobile/scSettings/settings/settings_page.dart';
import 'package:laborus_app/pages/mobile/scAuth/signup/signup.dart';
import 'package:laborus_app/pages/mobile/scLaborus/templates/home_template.dart';
import 'package:laborus_app/pages/mobile/scIntroduction/welcome/welcome_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _feedNavigatorKey = GlobalKey<NavigatorState>();
final _messageNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'Onboarding',
      path: '/',
      builder: (context, state) {
        return const OnBoardingPage();
      },
    ),
    GoRoute(
      name: 'Welcome',
      path: '/welcome',
      builder: (context, state) {
        return const WelcomePage();
      },
    ),
    GoRoute(
      path: '/create',
      name: 'create',
      builder: (context, state) {
        return const CreatePostPage();
      },
    ),
    GoRoute(
      path: '/home/profile',
      name: 'profile',
      builder: (context, state) {
        return const ProfilePage();
      },
    ),
    GoRoute(
      path: '/feed/post',
      name: 'post',
      builder: (context, state) {
        return PostFullSizePage(
          post: state.extra as Post,
        );
      },
    ),
    GoRoute(
      path: '/home/notification',
      name: 'notification',
      builder: (context, state) {
        return const NotificationPage();
      },
    ),
    GoRoute(
      path: '/signin',
      name: 'Signin',
      builder: (context, state) {
        return const SignInPage();
      },
    ),
    GoRoute(
      path: '/signup',
      name: 'Signup',
      builder: (context, state) {
        return const SignupWrapper();
      },
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
              path: '/home',
              name: 'Home',
              builder: (context, state) {
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
              name: 'Chat',
              builder: (context, state) {
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
              name: 'Settings',
              builder: (context, state) {
                return const SettingsPage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

get router => _router;
