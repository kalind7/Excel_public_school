import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/auth_logins/login_page.dart';
import 'package:new_project_work/ui_pages/splash_screen.dart';
import 'package:new_project_work/ui_pages/student/landing/student_landing_page.dart';

import 'router_constant.dart';

class Routers {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {

      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());

      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case studentLandingPage:
        return MaterialPageRoute(builder: (_) =>  StudentLandingPage());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}