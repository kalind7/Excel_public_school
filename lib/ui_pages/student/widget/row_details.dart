import 'package:flutter/cupertino.dart';
import 'package:new_project_work/utils/constant.dart';

Widget rowDetails({required String titleText, required String answerText}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const SizedBox(
          width: 20.0,
        ),
        Text(
          titleText,
          style: titleStyle,
        ),
        Text(
          ':',
          style: answerStyle,
        ),
        const SizedBox(
          width: 20.0,
        ),
        Text(
          answerText,
          style: answerStyle,
        ),
      ],
    ),
  );
}
