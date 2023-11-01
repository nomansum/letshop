import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:letshop/constants/routes.dart';
import 'package:letshop/features/auth/screens/auth_screen.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      path: AllRoutes.landingScreen,
      pageBuilder: (context, state) {
        return const MaterialPage(child: AuthScreen());
      },
    ),
  ]);
}
