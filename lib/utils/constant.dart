import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:new_project_work/utils/color.dart';

setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, 1, 1);
final kLastDay = DateTime(kToday.year, 12, kToday.day);

TextStyle titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: pink);
TextStyle answerStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    fontFamily: 'Roboto',
    color: pink);

String getHumanReadableDate(DateTime date) {
  return DateFormat.yMd().format(date);
}

