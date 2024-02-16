import 'package:flutter/material.dart';
import 'package:flutter_esgi/common/widgets/custom_snackbar.dart';
import 'package:go_router/go_router.dart';

class CloseRoute extends StatelessWidget {
  final String actualRoute;
  const CloseRoute({super.key, required this.actualRoute});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pop(actualRoute);
      },
      icon: const Icon(Icons.arrow_back_sharp),
    );
  }
  
}