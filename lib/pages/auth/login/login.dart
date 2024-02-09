import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/pages/auth/auth_bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../common/widgets/image_logo.dart';
import '../../../http/http_utils.dart';
import 'login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<AuthBloc>(context),
      listener: (BuildContext context, AuthState state) {
        if(state.status == Status.success) {
          context.go('/');
        }
        else if(state.status == Status.error) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Yay! A SnackBar!'),
          ));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {



          return const Scaffold(
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

          );
        },
      ),
    );
  }
}

// TODO: M'abonner au authState -> switch Status
// Status -> Error -> Toast
