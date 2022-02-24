import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              height: 50,
              width: 75,
              image: AssetImage('images/logo.png')),
        ],
      ),
    );
  }
}
