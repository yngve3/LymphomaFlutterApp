import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/presentation/pages/login/login_page.dart';
import 'package:lymphoma/presentation/pages/start/start_page.dart';
import 'package:lymphoma/presentation/routing/routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.start.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.start.path,
        builder: (context, state) => const StartPage(),
        routes: [
          GoRoute(
            path: Routes.login.lastPathComponent,
            builder: (context, state) => const LoginPage()
          ),
          GoRoute(
            path: Routes.registration.lastPathComponent,
            builder: (context, state) => const Placeholder()
          )
        ]
      )
    ]
  );
}