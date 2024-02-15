import 'package:flutter/material.dart';
import 'package:flutter_esgi/common/widgets/close_route.dart';

class UserPage extends StatelessWidget {
  final int userId;
  const UserPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseRoute(actualRoute: '/user',),
      ),
      body: SafeArea(child: Text(userId.toString()),),
    );
  }
}