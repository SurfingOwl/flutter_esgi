import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GesTwitTitle extends StatelessWidget {
  const GesTwitTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "GesTwit",
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Colors.white,
            fontFamily: GoogleFonts.getFont("Fredoka").fontFamily,
          ),
    );
  }
}
