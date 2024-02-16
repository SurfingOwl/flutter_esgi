import 'package:flutter/material.dart';
import 'package:flutter_esgi/common/widgets/%20custom_date.dart';
import 'package:flutter_esgi/common/widgets/user_header.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          context.push('/post_detail', extra: post.id);
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                UserHeader(name: post.author.name),
                const SizedBox(
                  height: 5,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: CustomDate(dateInt: post.createdAt)),
                const SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      post.content,
                      style: Theme.of(context).textTheme.titleMedium,
                    )), // todo couper fin
                if (post.image?.url != null) ...[
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    child:
                        Image.network(post.image!.url, width: double.infinity, height: 300, fit: BoxFit.cover),
                  )
                ],
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: [
                      const Icon(Icons.comment, color: Colors.white),
                      Text(post.commentsCount != null
                          ? post.commentsCount.toString()
                          : "0")
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
