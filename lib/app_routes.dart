import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/pages/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_esgi/pages/auth/register/register.dart';
import 'package:go_router/go_router.dart';
import 'http/http_utils.dart';
import 'pages/home/home.dart';
import 'pages/auth/login/login.dart';

class AppRoutes extends StatelessWidget {
  const AppRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state.status == Status.success && state.token != null){
              return const Home();
            }
            return const Login();
          },
    );
  }
}

class AuthenticatedRoutes extends StatelessWidget {
  AuthenticatedRoutes({super.key});

  final _router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const Register(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

}
