import 'package:flutter/material.dart';
import 'package:flutter_esgi/models/comment.dart';

class Comments extends StatelessWidget {
  final List<Comment>? comments;

  const Comments({
    super.key,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    if(comments != null) {
      return ListView.separated(
          itemBuilder: (_, index) {
            final comment = comments![index];
            return CommentCard(comment: comment);
          },
          separatorBuilder: (context, builder) {
            return const Divider();
          },
          itemCount: comments!.length);
    }
    else {
      return const Text("toot");
    }

  }
}

class CommentCard extends StatelessWidget {

  final Comment comment;

  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const Divider(color: Colors.white ),
          Row(
            children: [
              const Icon(Icons.account_circle_rounded, color: Colors.white),
              const SizedBox(
                width: 10,
              ),
              Text(comment.author!.name),
            ],
          ),
          const SizedBox(height: 5,),
          Align(alignment: Alignment.topLeft, child: Text(comment.content))
        ],
      ),
    );
  }
}
