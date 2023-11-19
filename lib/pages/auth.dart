import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/blocs/post/post_bloc.dart';
import 'package:flutter_esgi/blocs/user/user_bloc.dart';
import 'package:flutter_esgi/pages/home.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => PostBloc(),
        ),
      ],
      child: const Home(),
    );
  }
}
