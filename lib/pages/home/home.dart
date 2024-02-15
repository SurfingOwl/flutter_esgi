import 'package:flutter/material.dart';
import 'package:flutter_esgi/pages/home/posts/posts.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("GesTwit"),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    context.push("/new_post");
                  },
                  icon: const Icon(Icons.add)), // TODO change icon
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                      Icons.account_circle_rounded)) // TODO change icon
            ]),
        body: const Posts());
  }
}
