import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/blocs/auth_bloc.dart';

import 'home.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: UserBloc(),
        ),
        BlocProvider(
          create: PosteBloc(),
        ),
      ],
      child: const Home(),
    );
  }
}
