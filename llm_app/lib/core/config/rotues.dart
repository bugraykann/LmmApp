import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:llm_app/presentation/screens/auth/view/login_view.dart';
import 'package:llm_app/presentation/screens/auth/view/splash_view.dart';
import 'package:llm_app/presentation/screens/landing/view/album_detail_view.dart';
import 'package:llm_app/presentation/screens/landing/view/landing_view.dart';

abstract final class Routes {
  static GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static const String splash = 'splash';
  static const String login = 'login';
  static const String home = 'home';
  static const String detail = 'detail';
  static final routerConfig = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        name: splash,
        path: '/splash',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        name: login,
        path: '/login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        name: home,
        path: '/home',
        builder: (context, state) => const LandingView(),
        routes: [
          GoRoute(
            name: detail,
            path: 'detail',
            builder: (context, state) {
              final args = state.extra;
              return AlbumDetailView(
                args: args,
              );
            },
          )
        ],
      ),
    ],
  );
}
