import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../auth_bloc/auth_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pseudonymeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _navigateToLogin() {
    Navigator.pop(context);
  }

  void _register(context, pseudonyme, email, password) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(SignUp(name: pseudonyme, email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: TextFormField(
            controller: pseudonymeController,
            decoration: const InputDecoration(
              hintText: "Pseudonyme",
            ),
          ),
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
          onPressed: () => context.go('/login'),
          child: const Text("J'ai déjà un compte, me connecter."),
        ),
        ElevatedButton(
          onPressed: () => _register(context, pseudonymeController.text,
              emailController.text, passwordController.text),
          child: Text(
            "Créer un compte",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
