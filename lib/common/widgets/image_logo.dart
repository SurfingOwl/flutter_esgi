import 'package:flutter/material.dart';

class ImageLogo extends StatelessWidget {
  const ImageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        child: const Image(
          image: AssetImage('assets/flower_logo.png'),
          width: 200,
          height: 200,
        ),
      ),
    );
  }

}