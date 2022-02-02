import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/attendace.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/ui_pages/events.dart';
import 'package:new_project_work/ui_pages/function_dashboard.dart';
import 'package:new_project_work/ui_pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/gradstudent': (context) => GradStudent(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => Dashboard(),
        '/events': (context) => Events(),
        '/attendance': (context) => Attendance(),

          },
    );
  }
}


