import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/common/widgets/custom_snackbar.dart';
import 'package:flutter_esgi/pages/home/posts/posts.dart';
import 'package:go_router/go_router.dart';

import '../auth/auth_bloc/auth_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: const Text("GesTwit"),
                actions: <Widget>[
                  IconButton(
                      onPressed: () {
                        context.push("/new_post");
                        showSnackBar(context, "Vous devez être authentifier pour effectuer cette action");
                      },
                      icon: const Icon(Icons.add)),
                  IconButton(
                      onPressed: () {
                        var currentUserId = state.account?.id;
                        log(currentUserId.toString());
                        if(currentUserId != null) {
                          context.push('/user', extra: currentUserId);
                        }
                        else {
                          context.push('/login');
                          showSnackBar(context, "Vous devez être authentifier pour effectuer cette action");
                        }
                      },
                      icon: const Icon(
                          Icons.account_circle_rounded))
                ]),
            body: const Posts());
      });
  }
}
