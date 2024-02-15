import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/common/widgets/custom_snackbar.dart';
import 'package:flutter_esgi/common/widgets/close_route.dart';
import 'package:flutter_esgi/pages/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_bloc/post_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../http/http_utils.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key});

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  String? uploadImage;
  TextEditingController postContentController = TextEditingController();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        uploadImage = image!.path;
      });
    } catch (e) {
      callSnackBar();
    }
  }

  void callSnackBar() {
    showSnackBar(context, "Une erreur est survenue, veuillez réessayer.");
  }

  // TODO: if auth error redirect to login
  void submit() {
    final postBloc = BlocProvider.of<PostBloc>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final token = authBloc.state.token?.authToken;
    if (token == null) {
      return;
    }
    if (uploadImage == null) {
      postBloc.add(AddPostWithoutImage(
          token: token, content: postContentController.text));
    } else {
      postBloc.add(
        AddPostWithImage(
            token: token,
            content: postContentController.text,
            imagePath: uploadImage!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<PostBloc>(context),
      listener: (BuildContext context, PostState state) {
        log(state.status.toString());
        if (state.status == Status.success) {
          context.go('/');
        } else if (state.status == Status.error) {
          callSnackBar();
        }
      },
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: const CloseRoute(actualRoute: '/create_post',),
              title: const Text("Publication"),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: state.status == Status.loading
                      ? const SizedBox(width: 25,child: CircularProgressIndicator(),)
                      : ElevatedButton(
                          onPressed: () => submit(),
                          child: const Text("Publier"),
                          // style:
                        ),
                ),
              ],
            ),
            body: Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 12),
                    child: TextField(
                      controller: postContentController,
                      decoration: const InputDecoration(
                        hintText: "De quoi voulez vous parler",
                      ),
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  if (uploadImage == null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      child: TextButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: const Text("Ajouter une image"),
                      ),
                    ),
                  if (uploadImage != null) ...[
                    Image.file(
                      File(uploadImage!),
                      width: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      child: TextButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: const Text("Modifier l'image"),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
