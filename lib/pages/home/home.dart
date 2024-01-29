import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("GesTwit"),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.supervised_user_circle)) // TODO change icon
        ]
      ),
      body: const Text("Posts"),
    );
  }
}
