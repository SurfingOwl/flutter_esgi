import 'package:flutter/material.dart';
import 'package:flutter_esgi/pages/home/post_card.dart';

import '../../models/post.dart';
import '../../models/user.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("GesTwit"),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle_rounded)) // TODO change icon
        ]
      ),
      body: ListView.separated(
        itemBuilder: (_, index) {
            return PostCard(
              post: Post(id: 1, createdAt: DateTime.now(), content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at tortor ex. Praesent sodales elit ac nisl lobortis scelerisque non volutpat leo. Etiam euismod sem et est commodo, et eleifend magna condimentum. Ut laoreet sapien efficitur velit laoreet tempus. Quisque eu turpis erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed a faucibus metus. "
                  , author: User(id: 1, name: "Shan AZIZ", createdAt: DateTime.now())),
            );
        },
        separatorBuilder: (BuildContext context, int index) { return const Divider();},
        itemCount: 15,
      ),
    );
  }
}
