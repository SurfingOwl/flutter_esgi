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
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      child: const Image(
                          image: AssetImage('assets/flower_logo.png'),
                          width: 200,
                          height: 200
                      ),
                    ),
                  ),
              ),
              Expanded(
                  flex: 1,
                  child: Text("",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: Colors.white)
                  )
              ),
              const Expanded(flex: 6, child: LoginForm()),
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical:10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Adresse email",
                  labelStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.white)
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical:10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Mot de passe",
                  labelStyle: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.white)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical:10),
            child: ElevatedButton(
              onPressed: () {

              },
              child: Text(
                "Se connecter",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white) ,
              ),
            ),
          )
        ],
      ),
    );
  }
  
}
