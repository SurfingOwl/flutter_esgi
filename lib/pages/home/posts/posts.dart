import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_bloc/post_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_card/post_card.dart';

import '../../../http/http_utils.dart';
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
        switch (state.status) {
          case Status.success:
            log(state.posts.toString());
            final posts = state.posts;
            if(posts == null) {
              return const Text('no post');
            }
            return ListView.separated(
              itemBuilder: (_, index) {
                final post = posts.items[index];
                return PostCard(
                    post: post
                );
              },
              separatorBuilder: (BuildContext context, int index) { return const Divider();},
              itemCount: 10,
            );
          case Status.initial || Status.loading:
            return const Text("loading");
          case Status.error:
            return const Text("Error");
        }




      }
      ,
    );
  }


}