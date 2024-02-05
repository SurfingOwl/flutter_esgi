import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/blocs/post/post_bloc.dart';
import 'package:flutter_esgi/blocs/user/user_bloc.dart';
import 'package:flutter_esgi/datasources/post_data_source.dart';
import 'package:flutter_esgi/datasources/user_data_source.dart';
import 'package:flutter_esgi/pages/home.dart';
import 'package:flutter_esgi/repositories/post_repository.dart';
import 'package:flutter_esgi/repositories/user_repository.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
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
        child: const Home(),
      ),
    );
  }
}
