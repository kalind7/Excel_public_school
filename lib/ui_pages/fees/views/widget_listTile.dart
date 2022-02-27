import 'package:flutter/material.dart';

Widget listDetails({
  required String title,
  required String answer,
}){
  return Column(
    children: [
      ListTile(
        leading: Text(title,style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Roboto'),),
        trailing: Text(answer,style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Roboto'),),

      ),

      Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),child: Divider(height: 1.0,thickness: 1.0,color: Colors.pink.shade200,),),
    ],
  );
}