import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/common/widgets/gestwit_title.dart';
import 'package:flutter_esgi/pages/auth/register/register_form.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/custom_snackbar.dart';
import '../../../exceptions/auth/bad_request_exception.dart';
import '../../../exceptions/auth/invalid_credentials_exception.dart';
import '../../../http/http_utils.dart';
import '../auth_bloc/auth_bloc.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
                  "Ces identifiants sont déjà pris");
            case BadRequestException:
              showSnackBar(context,
                  "Vos identifiants sont invalide, veuillez réessayer");
            default:
              showSnackBar(
                  context, "Une erreur est survenue, veuillez réessayer");
          }
        }
      },
      child: const Scaffold(
        body: SafeArea(
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: GesTwitTitle(),
                ),
                RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
