import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(milliseconds: 1000),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}