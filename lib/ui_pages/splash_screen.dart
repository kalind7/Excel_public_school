import 'dart:async';
import 'package:excel_public_school/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 4),
            () => Get.toNamed('/login'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [  orangeOne, pinkOne],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: const Center(
          child: Image(
            height: 200,
            width: 200,
            image: AssetImage("files/images/excellogo.png"),
          ),
        ),
      ),
    );
  }
}