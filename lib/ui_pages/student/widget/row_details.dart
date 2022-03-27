
import 'package:flutter/cupertino.dart';
import 'package:new_project_work/utils/constant.dart';

Widget rowDetails({
  required String titleText,
  required Widget widget,
  required String answerText
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
    child: Row(

      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.baseline,
      // textBaseline: TextBaseline.ideographic,
      children: [

        Text(
          '${titleText}  :',
          style: titleStyle,
        ),

        widget,
        Text(
          answerText,
          style: answerStyle,
        ),
      ],
    ),
  );
}
