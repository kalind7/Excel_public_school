import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';

Widget button ({
  required String title,
  required Function onPress,
  required double width,
}){
  return SizedBox(
    width: width,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: pink,
          shadowColor: orangeOne,
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.all(5)),
      onPressed: () => onPress(),
      child: Text(
        title,
        style: buttonTitle,
      ),
    ),
  );
}