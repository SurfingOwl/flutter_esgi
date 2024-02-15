import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/common/widgets/custom_snackbar.dart';
import 'package:flutter_esgi/exceptions/auth/bad_request_exception.dart';
import 'package:flutter_esgi/exceptions/auth/invalid_credentials_exception.dart';
import 'package:flutter_esgi/pages/auth/auth_bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../common/widgets/image_logo.dart';
import '../../../http/http_utils.dart';
import 'login_form.dart';

// TODO: revenir a la home
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: BlocProvider.of<AuthBloc>(context),
        listener: (BuildContext context, AuthState state) {
          if (state.status == Status.success) {
            context.go('/');
          } else if (state.status == Status.error) {
            switch (state.error.runtimeType) {
              case InvalidCredentialsException:
                showSnackBar(context,
                    "Vos identifiants sont incorrects, veuillez réessayer");
              case BadRequestException:
                showSnackBar(context,
                    "Votre adresse email est invalide, veuillez réessayer");
              default:
                showSnackBar(
                    context, "Une erreur est survenue, veuillez réessayer");
            }
          }
        },
        child: const Scaffold(
          body: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ImageLogo(),
                ),
                Expanded(
                  flex: 3,
                  child: LoginForm(),
                ),
              ],
            ),
          ),
        ));
  }
}
