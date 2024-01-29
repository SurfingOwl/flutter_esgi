import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
              Expanded(
                flex: 2,
                child: SafeArea(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: const Image(
                        image: AssetImage('assets/flower_logo.png'),
                        width: 200,
                        height: 200
                    ),
                  ),
                )
              ),
              const Expanded(flex: 3, child: LoginForm()),
      ],
    )));
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("GesTwit", // TODO Font and make reusable logo
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.white)
              )
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical:5),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Adresse email",
                  labelStyle: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.white)
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical:5),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Mot de passe",
                  labelStyle: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white)
              ),
            ),
          ),
          TextButton(onPressed: () {  }, child: const Text("Vous n'avez pas de compte ? Inscrivez vous"),),
          ElevatedButton(
              onPressed: () {

              },
              // TODO as THEME
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              child: Text(
                "Se connecter",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Colors.white) ,
              ),
            ),
        ],
      ),
    );
  }
  
}
