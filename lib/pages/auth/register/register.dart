import 'package:flutter/material.dart';
import 'package:flutter_esgi/common/widgets/gestwit_title.dart';
import 'package:flutter_esgi/pages/auth/register/register_form.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
    );
    // BlocBuilder<AuthBloc, AuthState>(
    //   builder: (context, state) {

    //   }
    // ),
    // );
  }
}
