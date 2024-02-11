import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/common/widgets/custom_snackbar.dart';
import 'package:flutter_esgi/pages/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_esgi/pages/home/posts/post_bloc/post_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

// TODO: error, redirect and refactor
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
    showSnackBar(context, "Une erreur est survenue");
  }

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back),
        ), // TODO change icon
        title: const Text("Publication"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () => submit(),
              child: const Text("Publier"),
              // style:
            ),
          )
        ],
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
              child: TextField(
                controller: postContentController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "De quoi voulez vous parler",
                ),
                maxLines: 10,
                keyboardType: TextInputType.multiline,
              ),
            ),
            if (uploadImage == null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
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
  }
}
