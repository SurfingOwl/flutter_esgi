import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/gestwit_title.dart';
import '../auth_bloc/auth_bloc.dart';
import '../register/register.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(context, email, password) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(SignIn(email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: GesTwitTitle(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Adresse email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Mot de passe",
              ),
            ),
          ),
          TextButton(
            onPressed: () => context.go('/register'),
            child: const Text("Vous n'avez pas de compte ? Inscrivez vous"),
          ),
          ElevatedButton(
            onPressed: () {
              login(context, emailController.text,
                  passwordController.text);
            },
            child: Text(
              "Se connecter",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}