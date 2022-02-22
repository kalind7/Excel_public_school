import 'package:flutter/material.dart';

Widget BuildDrawerItem({
  required String text,
  required String iconTitle,
  required Function onPress,
}){
  return Column(
    children: [
      ListTile(
        leading: IconButton(
          onPressed: (){},
          iconSize: 16,
          icon: Image.asset(iconTitle),
        ),
        title: Text(text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            )),
        onTap: () {
          onPress();
        },
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Divider(
          thickness: 1,
          height: 1,
          color: Colors.white,
        ),

      ),

    ],
  );


}



