import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/pages/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_esgi/pages/auth/login/login.dart';
import 'package:flutter_esgi/pages/auth/register/register.dart';
import 'package:flutter_esgi/pages/home/home.dart';
import 'package:flutter_esgi/pages/home/post_form/post_form.dart';
import 'package:flutter_esgi/pages/home/posts/post_detail/post_detail.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> routes() {
  return [
    GoRoute(
      path: '/login',
      builder: (context, state) => const Login(),
      redirect: (context, state) => onAuthenticated(context),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const Register(),
      redirect: (context, state) => onAuthenticated(context),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/new_post',
      builder: (context, state) => const PostForm(),
      redirect: (context, state) => onUnauthenticated(context),
    ),
    GoRoute(
        path: '/post_detail/:id',
        builder: (context, state) => const PostDetail())
  ];
}

String? onAuthenticated(BuildContext context) {
  final state = context.read<AuthBloc>().state;
  if (state.isAuthenticated == true) {
    return '/';
  }
  return null;
}

String? onUnauthenticated(BuildContext context) {
  final state = context.read<AuthBloc>().state;
  if (state.isAuthenticated == false) {
    return '/login';
  }
  return null;
}
