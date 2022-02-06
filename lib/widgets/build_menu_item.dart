import 'package:flutter/material.dart';

Widget buildMenuItem({
  required String text,
  required IconData icon,
  required Function onpress,
}) {
  final color = Colors.white;
  final hoverColor = Colors.white70;
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.black87,
      size: 25.0,
    ),
    title: Text(text,
        style: TextStyle(
            color: Colors.black87,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          fontFamily: 'MontserratAlternates',
        )),
    hoverColor: hoverColor,
    onTap: () {
      onpress();
    },
  );
}
