import 'package:flutter/material.dart';

class CustomDate extends StatelessWidget {

  final DateTime dateTime;

  const CustomDate({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Text(dateString(dateTime));
  }

  String dateString(DateTime dateTime) {
    String day = dateTime.day.toString();
    String month = dateTime.month.toString();
    String year = dateTime.year.toString();
    String hour = dateTime.hour.toString();
    String min = dateTime.minute.toString();
    return "$day/$month/$year à $hour:$min";
  }
}