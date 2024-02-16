import 'package:flutter/material.dart';

class CustomDate extends StatelessWidget {

  final int dateInt;

  const CustomDate({super.key, required this.dateInt});

  @override
  Widget build(BuildContext context) {
    return Text(dateString(dateInt), style: const TextStyle(color: Colors.grey));
  }

  String dateString(int date) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date);
    String day = dateTime.day.toString();
    String month = dateTime.month.toString();
    String year = dateTime.year.toString();
    String hour = dateTime.hour.toString();
    String min = dateTime.minute.toString();
    return "$day/$month/$year à $hour:$min";
  }
}