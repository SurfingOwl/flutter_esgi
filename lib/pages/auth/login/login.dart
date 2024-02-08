import 'package:flutter/material.dart';
import '../../../common/widgets/image_logo.dart';
import 'login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}

// TODO: M'abonner au authState -> switch Status
// Status -> Error -> Toast

