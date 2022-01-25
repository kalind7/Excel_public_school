import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:new_project_work/ui_pages/forgot_password.dart';
import 'package:new_project_work/ui_pages/login_page.dart';
import 'package:new_project_work/utils/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),
          () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage())),
    );
  }


  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, lightRedColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: Center(
          child: Image(
            height: 200,
           width: 200,
           image: AssetImage("images/excellogo.png"),
          ),
        ),
      ),
    );
  }
}