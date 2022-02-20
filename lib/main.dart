import 'package:excel_public_school/ui_pages/dashboard.dart';
import 'package:excel_public_school/ui_pages/login_page.dart';
import 'package:excel_public_school/ui_pages/student_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);


    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: '/student',
      routes: {
        '/student': (context)=>  StudentDetails(),
        '/home': (context)=>  HomePage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}


