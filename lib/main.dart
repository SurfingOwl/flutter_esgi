import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/datasources/comment_data_source.dart';
import 'package:flutter_esgi/pages/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_bloc/post_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_detail/comment_bloc/comment_bloc.dart';
import 'package:flutter_esgi/pages/home/user/user/user_bloc.dart';
import 'package:flutter_esgi/repositories/comment_repository.dart';
import 'package:flutter_esgi/routes.dart';
import 'package:flutter_esgi/repositories/auth_repository.dart';
import 'package:flutter_esgi/repositories/post_repository.dart';
import 'package:flutter_esgi/repositories/user_repository.dart';
import 'package:flutter_esgi/theme.dart';
import 'package:go_router/go_router.dart';
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
          create: (context) => CommentRepository(commentDataSource: CommentDataSource()),
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
            create: (context) => CommentBloc(commentRepository: context.read<CommentRepository>()),
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
