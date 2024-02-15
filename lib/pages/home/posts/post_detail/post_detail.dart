import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/common/widgets/close_route.dart';
import 'package:flutter_esgi/common/widgets/user_header.dart';
import 'package:flutter_esgi/pages/home/posts/post_bloc/post_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_detail/comments.dart';
import 'package:go_router/go_router.dart';

import '../../../../http/http_utils.dart';

class PostDetail extends StatefulWidget {
  final int postId;

  const PostDetail({super.key, required this.postId});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {

  @override
  void initState() {
    super.initState();
    final postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(GetPostById(id: widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseRoute(actualRoute: '/post_detail'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch(state.status) {
            case Status.loading || Status.initial:
              return const Center(child: CircularProgressIndicator(),);
            case Status.success:
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        UserHeader(name: state.post!.author.name),
                        const SizedBox(height: 25,),
                        Align(alignment: Alignment.topLeft, child: Text(state.post!.content)),
                        const SizedBox(height: 10,),
                        Image.network(state.post!.image!.url),
                        const SizedBox(height: 25,),
                        ElevatedButton(onPressed: () {}, child: const Text("Ajouter un commentaire")),
                        const SizedBox(height: 25,),
                        Expanded(child: Comments(comments: state.post!.comments))
                      ],
                    ),
                  ),
                );
            case Status.error:
              return const Text("Une erreur est survenue");
          }

        },
      ),
    );
  }
}