import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/pages/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_bloc/post_bloc.dart';
import 'package:flutter_esgi/routes.dart';
import 'package:flutter_esgi/repositories/auth_repository.dart';
import 'package:flutter_esgi/repositories/post_repository.dart';
import 'package:flutter_esgi/repositories/user_repository.dart';
import 'package:flutter_esgi/theme.dart';
import 'package:go_router/go_router.dart';

import 'blocs/user/user_bloc.dart';
import 'datasources/auth_data_source.dart';
import 'datasources/post_data_source.dart';
import 'datasources/user_data_source.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(authDataSource: AuthDataSource()),
        ),
        RepositoryProvider(
          create: (context) => PostRepository(postDataSource: PostDataSource()),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(userDataSource: UserDataSource()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) => UserBloc(userRepository: context.read<UserRepository>()),
          ),
          BlocProvider(
            create: (context) => PostBloc(postRepository: context.read<PostRepository>()),
          ),
        ],
        child: MaterialApp.router(
          theme: appTheme(context),
          routerConfig: GoRouter(
            initialLocation: '/',
            routes: routes(),
          ),
        ),
      ),
    );
  }
}
