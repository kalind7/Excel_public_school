

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project_work/utils/fonts.dart';

Widget RowData({
  required String text,
  required String answer,
  required String differentiator,
  required double height,

}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(

        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          Text(
            text,
            style: subTitle,
          ),
          SizedBox(
            width: 20,
          ),

          Text(differentiator,style: subTitle,),

          SizedBox(width: 5,),
         Text(
            answer,
            style: subTitle,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
      SizedBox(height: height),
    ],
  );
}