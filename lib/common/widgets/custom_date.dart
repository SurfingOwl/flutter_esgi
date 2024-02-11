import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomDate extends StatelessWidget {

  final int dateInt;

  const CustomDate({super.key, required this.dateInt});

  @override
  Widget build(BuildContext context) {
    return Text(dateString(dateInt));
  }

  String dateString(int dateTime) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dateTime);
    return "${date.day}/${date.month}/${date.year}";
  }
}