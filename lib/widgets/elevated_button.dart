import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.text, required this.onPress, required this.color, required this.shadowColor}) : super(key: key);

  final String text;
  final Function onPress;
  final Color color;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:SizedBox(
        height: 35,
        width: 150.0,
        child: ElevatedButton(
          onPressed: () {onPress();},
          style: ElevatedButton.styleFrom(
              shadowColor: shadowColor,
              primary: color,
              onPrimary: Colors.white,
              onSurface: Colors.grey,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(5)),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'OpenSans'),
          ),
        ),
      ),
    );
  }
}
