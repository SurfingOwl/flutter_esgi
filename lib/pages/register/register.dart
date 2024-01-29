import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text("GesTwit", // TODO Font
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
                      labelText: "Pseudonyme",
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
              TextButton(onPressed: () {  }, child: const Text("J'ai déjà un compte, me connecter."),),
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
                  "Créer un compte",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white) ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}