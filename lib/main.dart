import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_project_work/route/router.dart';
import 'package:new_project_work/route/router_constant.dart';
import 'package:new_project_work/utils/color.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
      title: 'Excel Public School',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: pinkg,
      ),
      onGenerateRoute: Routers.onGenerateRoute,
      initialRoute: splashRoute,
      // navigatorKey: navigatorKey,
    );
  }
}
