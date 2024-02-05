import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/blocs/auth/auth_bloc.dart';
import 'package:flutter_esgi/pages/auth.dart';
import 'package:flutter_esgi/repositories/auth_repository.dart';

import 'datasources/auth_data_source.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(
        authDataSource: AuthDataSource(),
      ),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: context.read<AuthRepository>(),
        ),
        child: const MaterialApp(
          home: Auth(),
        ),
      ),
    );
  }
}
