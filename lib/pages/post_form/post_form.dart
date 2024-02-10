import 'package:flutter/material.dart';

class PostForm extends StatelessWidget {
  const PostForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)), // TODO change icon
          title: const Text("Publication"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Publier"),
                  // style:
              ),
            )
          ]
      ),
      body: Form(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 12),
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "De quoi voulez vous parler",
                ),
                maxLines: 10,
                keyboardType: TextInputType.multiline,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                child: TextButton(onPressed: () {  }, child: const Text("Ajouter une image"),) // TODO: Image picker and preview
            ),

          ],
        ),
      ),
    );
  }
}