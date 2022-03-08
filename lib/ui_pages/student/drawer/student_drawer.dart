import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/fees/views/fees.dart';
import 'package:new_project_work/ui_pages/library.dart';
import 'package:new_project_work/ui_pages/settings/settings.dart';
import 'package:new_project_work/ui_pages/student/attendance/views/student_attendance.dart';
import 'package:new_project_work/ui_pages/student/drawer/drawer_footer.dart';
import 'package:new_project_work/ui_pages/student/drawer/drawer_item.dart';
import 'package:new_project_work/ui_pages/student/routine/routine.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/teacher_home_page.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/logout_popup.dart';

class StudentDrawer extends StatefulWidget {
  const StudentDrawer({Key? key}) : super(key: key);

  @override
  State<StudentDrawer> createState() => _StudentDrawerState();
}

class _StudentDrawerState extends State<StudentDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      elevation: 3.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [orangeOne, orangeOne, pink],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Colors.white,
                          child: Image(
                            height: 75,
                            width: 75,
                            image: AssetImage('images/excellogo.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ram Bahadur Aryal',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    wordSpacing: 4,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Class: UKG',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 15,
                                    width: 30,
                                    child: VerticalDivider(
                                      thickness: 1,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Sec: A',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              const Text(
                                'Roll No : 01',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 12, right: 5, left: 5),
                    child: Divider(
                      height: 2,
                      thickness: 3,
                      color: Colors.white,
                    ),
                  ),
                  BuildDrawerItem(
                    text: 'Attendence',
                    iconTitle: 'assets/drawer_icons/std.png',
                    onPress: () {
                      Get.to(StudentAttendanceView());
                    },
                  ),
                  BuildDrawerItem(
                    text: 'Fees',
                    iconTitle: 'assets/drawer_icons/fees.png',
                    onPress: () {
                      Get.to(Fees());
                    },
                  ),
                  BuildDrawerItem(
                    text: 'Results',
                    iconTitle: 'assets/drawer_icons/exam.png',
                    onPress: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Fees()));
                    },
                  ),
                  BuildDrawerItem(
                    text: 'Subjects',
                    iconTitle: 'assets/drawer_icons/subjects.png',
                    onPress: () {
                      // Get.toNamed('/login');
                    },
                  ),
                  BuildDrawerItem(
                    text: 'Downloads',
                    iconTitle: 'assets/drawer_icons/downloads.png',
                    onPress: () {
                      // Get.toNamed('/login');
                    },
                  ),
                  BuildDrawerItem(
                    text: 'Routine',
                    iconTitle: 'assets/drawer_icons/routine.png',
                    onPress: () {
                      Get.to(Routine());
                    },
                  ),
                  BuildDrawerItem(
                    text: 'Library',
                    iconTitle: 'assets/drawer_icons/library.png',
                    onPress: () {
                      Get.to(Library());
                    },
                  ),
                  BuildDrawerItem(
                    text: 'Teachers',
                    iconTitle: 'assets/drawer_icons/teacher.png',
                    onPress: () {
                      Get.to(TeacherHomePage());
                    },
                  ),
                  BuildDrawerItem(
                    text: 'Exam',
                    iconTitle: 'assets/drawer_icons/onlineClass.png',
                    onPress: () {
                      // Get.toNamed('/login');
                    },
                  ),
                  BuildDrawerItem(
                    text: 'Dormitory',
                    iconTitle: 'assets/drawer_icons/dorm.png',
                    onPress: () {
                      Get.toNamed('/login');
                    },
                  ),
                  BuildDrawerItem(
                    text: 'Transport',
                    iconTitle: 'assets/drawer_icons/bus.png',
                    onPress: () {
                      Get.toNamed('/login');
                    },
                  ),
                  BuildDrawerItem(
                    text: 'Logout',
                    iconTitle: 'assets/drawer_icons/logout2.png',
                    onPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                        const BuildPopupDialog(),
                      );
                    },
                  ),
                  BuildDrawerItem(
                    text: 'Settings',
                    iconTitle: 'assets/drawer_icons/settings.png',
                    onPress: () {
                      Get.to(Settings());
                    },
                  ),
                  DrawerFooter(),

                  SizedBox(height: 80.0,),

                ],
              ),
            )
          ),

        ],
      ),
    );
  }
}
