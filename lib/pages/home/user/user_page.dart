import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_esgi/common/widgets/close_route.dart';
import 'package:flutter_esgi/common/widgets/user_header.dart';
import 'package:flutter_esgi/pages/home/user/user/user_bloc.dart';

import '../../../http/http_utils.dart';
import '../posts/post_bloc/post_bloc.dart';

class UserPage extends StatefulWidget {
  final int userId;
  const UserPage({super.key, required this.userId});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  
  @override
  void initState() {
    super.initState();
    final userBloc = BlocProvider.of<UserBloc>(context);
    final postBloc = BlocProvider.of<PostBloc>(context);
    userBloc.add(GetUserRecord(id: widget.userId));
    postBloc.add(GetUserPosts(id: widget.userId, page: 0, size: 10));
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.loading || Status.initial:
            return const Center(child: CircularProgressIndicator(),);
          case Status.success:
            var user = state.user;
            return Scaffold(
              appBar: AppBar(
                leading: const CloseRoute(
                  actualRoute: '/user',
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    UserHeader(name: user!.name),
                    Text(user.id.toString()),
                    const SizedBox(height: 20,)

                    // TODO: post list
                  ],
                ),
              ),
            );
          case Status.error:
            return const Center(child: Text("Une erreur est survenue"));
        }

      },
    );
  }
}
