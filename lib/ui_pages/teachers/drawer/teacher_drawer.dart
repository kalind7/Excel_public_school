import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:new_project_work/ui_pages/settings/settings.dart';
import 'package:new_project_work/ui_pages/student/drawer/drawer_footer.dart';
import 'package:new_project_work/ui_pages/student/drawer/drawer_item.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/assign_marks/assign_marks.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/classwise_result/classwise_result.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/eca_grades/eca_grades.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/exam_remarks/exam_remarks.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/practical_exam/practical_exam.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/practical_result/practical_result.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/homework_gridpage/add_homework.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/homework_gridpage/homework_list.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/student_grid_pages/attendance_report.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/student_grid_pages/attendance_sumary.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/student_grid_pages/student_attendance.dart';
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Teacher',
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
                                        thickness: 2,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Mathematics',
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
                                  'Teacher Id : 01',
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
                        thickness: 2,
                        color: Colors.white,
                      ),
                    ),
                    ExpansionTile(
                      collapsedIconColor: Colors.white,
                      title: Text(
                        'Student Info',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto'),
                      ),
                      children: [
                       BuildDrawerItem(
                         text: 'Student Attendance',
                         iconTitle: 'assets/teacher_homepage_icons/Attendance.png',
                         onPress: () => Get.to(() => StudentAttendance()),
                       ),
                        BuildDrawerItem(
                          text: 'Attendance Report',
                          iconTitle: 'assets/teacher_homepage_icons/attendance_report.png',
                          onPress: () => Get.to(() => AttendanceReport()),
                        ),
                        BuildDrawerItem(
                          text: 'Attendance Summary',
                          iconTitle: 'assets/teacher_homepage_icons/attendance_summary.png',
                          onPress: () => Get.to(() => AttendanceSummary()),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      collapsedIconColor: Colors.white,
                      title: Text(
                        'Exam Info',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto'),
                      ),
                      children: [
                        BuildDrawerItem(
                          text: 'Add Exam Practical',
                          iconTitle: 'assets/teacher_homepage_icons/add_exam_practical.png',
                          onPress: () => Get.to(() => ExamPractical(secondTitle: 'Add New Practical', title: 'Add Exam Practical')),
                        ),
                        BuildDrawerItem(
                          text: 'Practical Result',
                          iconTitle: 'assets/teacher_homepage_icons/Exam.png',
                          onPress: () => Get.to(() => PracticalResult()),
                        ),
                        BuildDrawerItem(
                          text: 'Assign Marks',
                          iconTitle: 'assets/teacher_homepage_icons/assign_marks.png',
                          onPress: () => Get.to(() => AssignMarks()),
                        ),
                        BuildDrawerItem(
                          text: 'ECA Grades',
                          iconTitle: 'assets/teacher_homepage_icons/Student Male.png',
                          onPress: () => Get.to(() => ECAGrades()),
                        ),
                        BuildDrawerItem(
                          text: 'Classwise Result',
                          iconTitle: 'assets/teacher_homepage_icons/classwise_result.png',
                          onPress: () => Get.to(() => ClasswiseResult()),
                        ),
                        BuildDrawerItem(
                          text: 'Exam Remarks',
                          iconTitle: 'assets/teacher_homepage_icons/exam_remarks.png',
                          onPress: () => Get.to(() => ExamRemarks()),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      collapsedIconColor: Colors.white,
                      title: Text(
                        'Homework Info',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto'),
                      ),
                      children: [
                        BuildDrawerItem(
                          text: 'Add Homework',
                          iconTitle: 'assets/teacher_homepage_icons/add_homework.png',
                          onPress: () => Get.to(() => AddHomework(title: 'Homework', onPress: () {})),
                        ),
                        BuildDrawerItem(
                          text: 'Homework List',
                          iconTitle: 'assets/teacher_homepage_icons/homework.png',
                          onPress: () => Get.to(() => HomeworkList(title: 'Homework', title2: 'Homework List', onPress: (){})),
                        ),

                      ],
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
              )),
          DrawerFooter(),
        ],
      ),
    );
  }
}
