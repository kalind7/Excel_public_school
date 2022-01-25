import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';


class HeaderContainer extends StatelessWidget {
  final String text ;

  HeaderContainer({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, lightRedColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.black,fontSize: 20),
              )),
          Center(
            child: Image(
              height: 150,
              width: 150,
              image: AssetImage("images/excellogo.png"),
            ),
          ),
        ],
      ),
    );
  }
}