import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/ui_pages/grad_student.dart';
import 'package:new_project_work/ui_pages/login_page.dart';
import 'package:new_project_work/ui_pages/splash_screen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => GradStudent(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => Dashboard(),
          },

    );
  }
}


