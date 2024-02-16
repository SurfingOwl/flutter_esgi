import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/models/post.dart';
import 'package:flutter_esgi/pages/home/posts/post_bloc/post_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_card/post_card.dart';

import '../../../http/http_utils.dart';

// TODO: manage loader
// TODO: manage scroll pagination
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

  Future<void> _pullRefresh() async {
    final postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(RefreshPost());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        List<Post>? posts = state.posts;
        if (posts != null) {
          return RefreshIndicator(
            onRefresh: _pullRefresh,
            child: ListView.separated(
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
            ),
          );
        }
        else if (state.status == Status.loading && posts == null) {
          return const Center(child: CircularProgressIndicator(),);
        }
        else {
          return const Center(
              child: Text("Il n'y a aucun post pour le moment"));
        }
      },
    );
  }

  void _onScroll() {
    if (
        scrollController.position.maxScrollExtent == scrollController.position.pixels) {
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
