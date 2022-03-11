import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';

Widget newContainer({
  required String title,
  required Widget widget,
  required Size height,
  required Size width,
}){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Padding(padding: EdgeInsets.symmetric(horizontal: 7,vertical: 7),child: Text(title,style: examRowTitle,),),

      Container(
        height: height.height * 0.06,
        width: width.width,
        margin: EdgeInsets.symmetric(horizontal: 7),
        padding: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: orangeOne,
              spreadRadius: .5,
              blurRadius: 4,
              blurStyle: BlurStyle.inner,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: widget,
      ),
    ],
  );
}
