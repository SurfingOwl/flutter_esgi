import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {

  final String name;

  const UserHeader({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.account_circle_rounded, color: Colors.white),
        const SizedBox(width: 10,),
        Text(name, style: Theme.of(context).textTheme.headlineSmall)
      ],
    );

  }

}