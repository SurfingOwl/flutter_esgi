import 'package:flutter/material.dart';

import '../../models/post.dart';

class PostCard extends StatelessWidget {

  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft, child: Text(post.content)),
            if(post.image?.url != null) ...[
              const SizedBox(height: 20),
              Image.network(post.image!.url)
            ],
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.arrow_right, color: Colors.white,),
                  Text(post.author.name),
                  const SizedBox(width: 10,),
                  Text(post.createdAt.toLocal().toString()) // TODO composant qui affiche proprement le Datetime
                ],
              ),
            ),

          ],
        )
      ),
    );
  }
}