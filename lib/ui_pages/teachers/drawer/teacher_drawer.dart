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

class TeacherDrawer extends StatefulWidget {
  const TeacherDrawer({Key? key}) : super(key: key);

  @override
  State<TeacherDrawer> createState() => _TeacherDrawerState();
}

class _TeacherDrawerState extends State<TeacherDrawer> {
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

                  ],
                ),
              )
          ),

          DrawerFooter(),


        ],
      ),
    );
  }
}
