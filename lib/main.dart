import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/blocs/auth/auth_bloc.dart';
import 'package:flutter_esgi/datasources/auth_data_source.dart';
import 'package:flutter_esgi/pages/login/login.dart';
import 'package:flutter_esgi/repositories/auth_repository.dart';


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
        child: MaterialApp(
          theme: ThemeData(
            // textTheme: GoogleFonts,
            scaffoldBackgroundColor: Colors.black38,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
            textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 0.0),
              )
            )
          ),
          home: const Login(),
        ),
      );
  }
}
