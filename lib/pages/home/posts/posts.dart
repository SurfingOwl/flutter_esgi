import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/models/post.dart';
import 'package:flutter_esgi/pages/home/posts/post_bloc/post_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_card/post_card.dart';

import '../../../http/http_utils.dart';

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
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(GetAllPosts(page: 1, size: 10));
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        List<Post>? posts = state.posts;
        if (posts != null) {
          return ListView.separated(
            controller: scrollController,
            itemBuilder: (_, index) {
              if(index < posts.length) {
                final post = posts[index];
                return PostCard(post: post);
              }
              else{
                return const BottomLoader();
              }

            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemCount: state.status == Status.loading ? posts.length + 1 : posts.length,
          );
        }
        return const Center(
            child: Text("Il n'y a aucun post pour le moment"));
        // switch (state.status) {
        //   case Status.success || Status.loading:
        //
        //   case Status.initial:
        //     return const Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   case Status.error:
        //     return const Text("Error");
        // }
      },
    );
  }

  void _onScroll() {
    if (
        scrollController.position.maxScrollExtent - scrollController.position.pixels <= 200) {
      final postBloc = BlocProvider.of<PostBloc>(context);
      if(Status.loading != postBloc.state.status) {
        int? page = postBloc.state.paginationInfo!.nextPage;
        if (page != null) {
          log(page.toString());
          postBloc.add(GetAllPosts(page: page, size: 10));
        }
      }
    }
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
