import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/ui_pages/auth_logins/login_page.dart';
import 'package:new_project_work/ui_pages/student/homework/views/student_today_homework.dart';
import 'package:new_project_work/ui_pages/student/landing/student_landing_page.dart';
import 'package:new_project_work/utils/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkSession();
    super.initState();
  }

  checkSession() async {
    var _duration = Duration(seconds: 3);

    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    var box = await Hive.openBox(Constants.APPNAME);
    var isLoggedIn = box.get(Constants.isLoggedIn, defaultValue: false);
    var role = box.get(Constants.roll);
    if (isLoggedIn) {
      // var profileResponse = await ApiServices().get(ApiUrl.detail);
      // var resp = ProfileResponse.fromJson(profileResponse);

      // if (resp.status) {
      //   var profile = resp.data;
      //   box.put(Constants.profileImage, resp.data.enduserprofile!.profileImage);
      //   Get.find<AccountController>().setProfile(profile);
      //   log(Get.find<AccountController>()
      //       .profile
      //       .value
      //       .enduserprofile!
      //       .currentAddress);
      // }
    }
    Get.off(isLoggedIn
        ? role == 2
            ? StudentLandingPage()
            : StudentHomework()
        : LoginPage());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            pink,
            orangeOne,
          ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
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
