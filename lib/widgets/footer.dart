import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Image(
            height: 50,
            width: 75,
            image: AssetImage('files/images/allstar.png')),
      ],
    );
  }
}