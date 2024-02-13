import 'package:flutter/material.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    // textTheme: GoogleFonts,
    scaffoldBackgroundColor: Colors.black38,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
    textTheme: Theme.of(context).textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: Colors.white),
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.purple, width: 2.5),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.purple, width: 1.5),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.purple.withOpacity(0.2),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}