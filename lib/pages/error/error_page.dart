import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('GesTwit'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 300,
            ),
            Text('Un erreur est survenue',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white)),
            TextButton(onPressed: () { context.go("/");}, child: Text('Réessayer')),
          ],
        ),
      ),
    );
  }
}
