import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.text, required this.onPress}) : super(key: key);

  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:SizedBox(
        height: 40,
        width: 200.0,
        child: ElevatedButton(
          onPressed: () {onPress();},
          style: ElevatedButton.styleFrom(
              shadowColor: Colors.green.shade200,
              primary: Colors.green.shade200,
              onPrimary: Colors.white,
              onSurface: Colors.grey,
              elevation: 1,
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
