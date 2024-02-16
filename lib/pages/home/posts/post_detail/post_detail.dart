import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/common/widgets/close_route.dart';
import 'package:flutter_esgi/common/widgets/custom_snackbar.dart';
import 'package:flutter_esgi/common/widgets/user_header.dart';
import 'package:flutter_esgi/pages/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_bloc/post_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_detail/comment_bloc/comment_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_detail/comments.dart';
import 'package:go_router/go_router.dart';

import '../../../../http/http_utils.dart';

// TODO fix page size
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

  TextEditingController commentController = TextEditingController();


  void sendComment(String text) {
    final commentBloc = BlocProvider.of<CommentBloc>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);
    var token = authBloc.state.token?.authToken;
    if(token != null && text.isNotEmpty) {
      commentBloc.add(AddComment(token: token, id: widget.postId, content: text));
    }
    else if(text.isEmpty) {
      showSnackBar(context, "Vous devez entrer du texte");
    }
    else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseRoute(actualRoute: '/post_detail'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.loading || Status.initial:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.success:
              if(state.post != null) {
                return SafeArea(
                  // child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        UserHeader(name: state.post!.author.name),
                        const SizedBox(
                          height: 25,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(state.post!.content, style: Theme.of(context).textTheme.titleSmall,)),
                        const SizedBox(
                          height: 10,
                        ),
                        if (state.post?.image != null)
                          Image.network(
                            state.post!.image!.url,
                            width: 400,
                            height: 400,
                          ),
                        const SizedBox(
                          height: 25,
                        ),
                        const SizedBox(height: 5,),
                        Form(
                          child: Row(
                            children: [
                              Flexible(child: TextField(controller: commentController, decoration: const InputDecoration(
                                hintText: "Votre commentaire",
                              ),)),
                              IconButton(
                                onPressed: () { sendComment(commentController.text); },
                                icon: const Icon(
                                  Icons.send_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Flexible(child: Comments(comments: state.post!.comments))
                      ],
                    ),
                  ),
                  // ),
                );
              }
              else {
                return const Center(child: CircularProgressIndicator(),);
              }

            case Status.error:
              return const Center(
                  child: Text("Une erreur est survenue, veuillez réessayer"));
          }
        },
      ),
    );
  }
}
