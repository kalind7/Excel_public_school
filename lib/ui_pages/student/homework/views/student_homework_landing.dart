import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/homework/controller/student_homework_controller.dart';
import 'package:new_project_work/ui_pages/student/homework/views/student_monthly_homework.dart';
import 'package:new_project_work/ui_pages/student/homework/views/student_today_homework.dart';
import 'package:new_project_work/ui_pages/student/homework/views/student_weekly_homework.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/appbar.dart';


class StudentHomeworkLanding extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // TabController tabController = TabController(length: 3, vsync: this);

  final StudentHomeworkController studentHomeworkController =
      Get.put(StudentHomeworkController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          child: WidgetAppbar(
            title: '',
            onPress: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: Icons.menu,
          ),
          preferredSize: Size.fromHeight(55.0)),
      key: _scaffoldKey,
      body: BodyWithWidgetContainer(
        top: 100,
        upperWidget: DefaultTabController(
            length: 3,
            child: ButtonsTabBar(
                controller: studentHomeworkController.controller,
                backgroundColor: pink,
                unselectedBackgroundColor: Colors.grey[300],
                radius: 5,
                tabs: studentHomeworkController.myTabs)),
        bodyWidget: Container(
            height: MediaQuery.of(context).size.height / 1.45,
            child: TabBarView(
              controller: studentHomeworkController.controller,
              children: [
                      StudentHomework(),
                StudentWeeklyHomework(),
          
                StudentMonthlyHomework()
              ],
            )
            ),
      ),
    );
  }
}
