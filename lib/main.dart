import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/assignment.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/ui_pages/events.dart';
import 'package:new_project_work/ui_pages/function_dashboard.dart';
import 'package:new_project_work/ui_pages/library.dart';
import 'package:new_project_work/ui_pages/list_of_teacher.dart';
import 'package:new_project_work/ui_pages/login_page.dart';
import 'package:new_project_work/ui_pages/routine.dart';
import 'package:new_project_work/ui_pages/splash_screen.dart';
import 'package:new_project_work/widgets/filter_list.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
      initialRoute: '/splash',
      routes: {

        '/library': (context)=> Library(),
        '/filter':(context) => FilterList(),
        '/routine': (context) => Routine(),
        '/splash': (context) => SplashScreen(),
        '/gradstudent': (context) => GradStudent(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => Dashboard(),
        '/events': (context) => Events(),
        '/assignment': (context) => Assignment(),
        '/teacherlist': (context) => TeacherLists(),

      },
    );
  }
}
