import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/model/laborus/post.dart';
import 'package:laborus_app/pages/mobile/scAuth/CYA/choose_your_account_page.dart';
import 'package:laborus_app/pages/mobile/scSocial/chat/chat_page.dart';
import 'package:laborus_app/pages/mobile/scLaborus/create_post/create_post_page.dart';
import 'package:laborus_app/pages/mobile/scLaborus/feed/feed_page.dart';
import 'package:laborus_app/pages/mobile/scSocial/notification/notification_view.dart';
import 'package:laborus_app/pages/mobile/scIntroduction/onB/onb_page.dart';
import 'package:laborus_app/pages/mobile/scLaborus/post_full_size/post_full_size_page.dart';
import 'package:laborus_app/pages/mobile/scSocial/profile/profile.dart';
import 'package:laborus_app/pages/mobile/scSettings/settings/settings_page.dart';
import 'package:laborus_app/pages/mobile/scAuth/signin/signin.dart';
import 'package:laborus_app/pages/mobile/scAuth/signup/signup.dart';
import 'package:laborus_app/pages/mobile/templates/home_template.dart';
import 'package:laborus_app/pages/mobile/templates/sign_template.dart';
import 'package:laborus_app/pages/mobile/scAuth/timeline/timeline_page.dart';
import 'package:laborus_app/pages/mobile/scIntroduction/welcome/welcome_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _feedNavigatorKey = GlobalKey<NavigatorState>();
final _messageNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>();
final _signinNavigatorKey = GlobalKey<NavigatorState>();
final _signupNavigatorKey = GlobalKey<NavigatorState>();
final _infoNavigatorKey = GlobalKey<NavigatorState>();
final _signinStepNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'onboarding',
      path: '/',
      builder: (context, state) {
        return const OnBoardingPage();
      },
    ),
    GoRoute(
      name: 'welcome',
      path: '/welcome',
      builder: (context, state) {
        return const WelcomePage();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          SignTemplate(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _signinNavigatorKey,
          routes: [
            GoRoute(
              path: '/signin',
              name: 'signin',
              builder: (context, state) {
                return const ChooseYourAccountPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _signupNavigatorKey,
          routes: [
            GoRoute(
              path: '/signup',
              name: 'signup',
              builder: (context, state) {
                return const SignUpPage();
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
                return const SettingsPage();
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/signin/sucess',
      name: 'sucess',
      builder: (context, state) {
        return const SiginSucess();
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
  ],
);

get router => _router;
