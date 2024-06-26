import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/model/laborus/post.dart';
import 'package:laborus_app/pages/scAuth/CYA/choose_your_account_page.dart';
import 'package:laborus_app/pages/scSocial/chat/chat_page.dart';
import 'package:laborus_app/pages/scLaborus/create_post/create_post_page.dart';
import 'package:laborus_app/pages/scLaborus/feed/feed_page.dart';
import 'package:laborus_app/pages/scSocial/notification/notification_view.dart';
import 'package:laborus_app/pages/scIntroduction/onB/onb_page.dart';
import 'package:laborus_app/pages/scLaborus/post_full_size/post_full_size_page.dart';
import 'package:laborus_app/pages/scSocial/profile/profile.dart';
import 'package:laborus_app/pages/scSettings/settings/settings_page.dart';
import 'package:laborus_app/pages/scAuth/signin/signin.dart';
import 'package:laborus_app/pages/scAuth/signin/steps/step_1.dart';
import 'package:laborus_app/pages/scAuth/signin/steps/step_2.dart';
import 'package:laborus_app/pages/scAuth/signin/steps/step_3.dart';
import 'package:laborus_app/pages/scAuth/signup/signup.dart';
import 'package:laborus_app/pages/templates/home_template.dart';
import 'package:laborus_app/pages/templates/sign_steps_template.dart';
import 'package:laborus_app/pages/templates/sign_template.dart';
import 'package:laborus_app/pages/scAuth/timeline/timeline_page.dart';
import 'package:laborus_app/pages/scIntroduction/welcome/welcome_page.dart';
import 'package:laborus_app/core/utils/routes/global_routes.dart';

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
        GlobalRouteStack.push(state.name.toString());
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
                GlobalRouteStack.push(state.name.toString());
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
                GlobalRouteStack.push(state.name.toString());
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
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => SignStepsTemplate(
        navigationShell: navigationShell,
        maxSteps: 3,
      ),
      branches: [
        StatefulShellBranch(
          navigatorKey: _signinStepNavigatorKey,
          routes: [
            GoRoute(
              path: '/signin/step1',
              name: 'signinStep1',
              builder: (context, state) {
                GlobalRouteStack.push(state.name.toString());
                return const StepPage1();
              },
            ),
            GoRoute(
              path: '/signin/step2',
              name: 'signinStep2',
              builder: (context, state) {
                GlobalRouteStack.push(state.name.toString());
                return StepPage2();
              },
            ),
            GoRoute(
              path: '/signin/step3',
              name: 'signinStep3',
              builder: (context, state) {
                GlobalRouteStack.push(state.name.toString());
                return const StepPage3();
              },
            ),
          ],
        )
      ],
    ),
    GoRoute(
      path: '/signin/sucess',
      name: 'sucess',
      builder: (context, state) {
        GlobalRouteStack.push('welcome');
        return const SiginSucess();
      },
    ),
    GoRoute(
      path: '/create',
      name: 'create',
      builder: (context, state) {
        GlobalRouteStack.push('create');
        return const CreatePostPage();
      },
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
      path: '/feed/post',
      name: 'post',
      builder: (context, state) {
        GlobalRouteStack.push(state.name.toString());
        return PostFullSizePage(
          post: state.extra as Post,
        );
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
