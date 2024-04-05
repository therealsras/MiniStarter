import 'package:app/models/app_model.dart';
import 'package:app/models/profile_model.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/account/login_page.dart';
import './router_constants.dart';

class AppRouter {
  final AppModel appModel;
  final ProfileModel profileModel;

  AppRouter(
    this.appModel,
    this.profileModel,
  );

  // Initialize GoRouter with routing configuration
  late final router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: appModel,
    initialLocation: '/login',
    observers: [BotToastNavigatorObserver()],
    routes: _configureRoutes(),
    redirect: _handleRedirect,
    errorPageBuilder: _buildErrorPage,
  );

  // Helper method to configure routes
  List<GoRoute> _configureRoutes() {
    return [
      GoRoute(
        name: GoRouteConstants.loginRouteName,
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      // GoRoute(
      //   name: GoRouteConstants.onBoardingRouteName,
      //   path: '/onboarding',
      //   builder: (context, state) => const OnboardingPage(),
      // ),
    ];
  }

  // Helper method to handle redirection
  String? _handleRedirect(BuildContext context, GoRouterState state) {
    // final loggedIn = appModel.isLoggedIn;
    const loggedIn = false;
    final loggingIn = state.matchedLocation == '/login';
    if (!loggedIn) return loggingIn ? null : '/login';

  }

  // Helper method to build error page
  MaterialPage _buildErrorPage(BuildContext context, GoRouterState state) {
    return MaterialPage(
      key: state.pageKey,
      child: Scaffold(body: Center(child: Text(state.error.toString()))),
    );
  }
}
