import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:new_project_work/ui_pages/dashboard.dart';
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



  void initState() {
      Timer(
        Duration(seconds: 2),
            () => Get.to( LoginPage()));
    super.initState();

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [greenOne, greenTwo, greenThree, greenFour],
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
