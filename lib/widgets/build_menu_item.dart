import 'package:excel_public_school/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildMenuItem({
  required String text,
  required String iconTitle,
  required Function onPress,
}) {
  const hoverColor = Colors.white70;
  return Column(
    children: [
      ListTile(
        leading: IconButton(
          onPressed: (){},
          iconSize: 20,
          icon: Image.asset(iconTitle),
        ),
        title: Text(text,
            style: drawerTitle),
        hoverColor: hoverColor,
        onTap: () {
          onPress();
        },

      ),

      const Divider(
        height: 1.0,
        thickness: 1.0,
        color: Colors.white,
      ),
    ],
  );
}