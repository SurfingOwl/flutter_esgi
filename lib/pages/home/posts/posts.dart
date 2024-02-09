import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_bloc/post_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_card/post_card.dart';

import '../../../models/image.dart';
import '../../../models/post.dart';
import '../../../models/user.dart';

// TODO: retrieve from API
// TODO: manage loader
// TODO: show info
// TODO: manage scroll pagination
// TODO: redirect to detail page
class Posts extends StatefulWidget {
  const Posts({super.key});

  static Post post = Post(
      id: 1,
      createdAt: DateTime.now(),
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at tortor ex. Praesent sodales elit ac nisl lobortis scelerisque non volutpat leo. Etiam euismod sem et est commodo, et eleifend magna condimentum. Ut laoreet sapien efficitur velit laoreet tempus. Quisque eu turpis erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed a faucibus metus. ",
      author: User(id: 1, name: "Shan AZIZ", createdAt: DateTime.now()),
      image: PostImage(path: '', name: '', type: '', size: 100, mime: '', meta: {}, url: 'https://www.powertrafic.fr/wp-content/uploads/2023/04/image-ia-exemple.png'),
      commentsCount: 10
  );

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {


  @override
  void initState() {
    super.initState();
    final postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(GetAllPosts(page: 1, size: 10));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        final posts = state.posts;
        return ListView.separated(
          itemBuilder: (_, index) {
            final post = posts.items[index];
            return PostCard(
                post: post
            );
          },
          separatorBuilder: (BuildContext context, int index) { return const Divider();},
          itemCount: posts!.pageTotal,
        );
      }
      ,
    );
  }


}