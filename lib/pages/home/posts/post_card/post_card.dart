import 'package:flutter/material.dart';
import 'package:flutter_esgi/common/widgets/%20custom_date.dart';

import '../../../../models/post.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.arrow_right, color: Colors.white,),
                      Text(post.author.name),
                      const SizedBox(width: 10,),
                      CustomDate(dateTime: post.createdAt),
                    ],
                  ),
                ),
                if(post.commentsCount != null)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        const Icon(Icons.comment, color: Colors.white),
                        Text(post.commentsCount.toString())
                      ],
                    ),
                  ),
              ]
            ),
          ],
        )
      ),
    );
  }
}