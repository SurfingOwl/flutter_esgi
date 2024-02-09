import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/pages/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_esgi/datasources/auth_data_source.dart';
import 'package:flutter_esgi/pages/auth/login/login.dart';
import 'package:flutter_esgi/pages/auth/register/register.dart';
import 'package:flutter_esgi/pages/home/home.dart';
import 'package:flutter_esgi/repositories/auth_repository.dart';
import 'package:flutter_esgi/repositories/post_repository.dart';
import 'package:flutter_esgi/repositories/user_repository.dart';
import 'package:go_router/go_router.dart';

import 'blocs/post/post_bloc.dart';
import 'blocs/user/user_bloc.dart';
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
          create: (context) => AuthRepository(
            authDataSource: AuthDataSource(),
          ),
        ),
        RepositoryProvider(
          create: (context) => PostRepository(
            postDataSource: PostDataSource(),
          ),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(
            userDataSource: UserDataSource(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              userRepository: context.read<UserRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => PostBloc(
              postRepository: context.read<PostRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData(
            // textTheme: GoogleFonts,
            scaffoldBackgroundColor: Colors.black38,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.white),
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 2.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 1.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.purple.withOpacity(0.2),
            ),
          ),
          routerConfig: GoRouter(
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
              GoRoute(
                path: '/',
                builder: (context, state) => const Home(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
