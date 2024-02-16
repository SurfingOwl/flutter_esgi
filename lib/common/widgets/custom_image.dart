import 'package:flutter/material.dart';

import '../../models/image.dart';

class CustomImage extends StatelessWidget {
  final PostImage image;

  const CustomImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        10.0,
      ),
      child:
      Image.network(image.url, width: double.infinity, height: 300, fit: BoxFit.cover),
    );
  }

}