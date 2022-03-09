import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/student_grid_pages/attendance_report.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/student_grid_pages/attendance_sumary.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/student_grid_pages/student_attendance.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';

class StudentInfo {
  final Widget icon;
  final String iconTitle;
  final Function onPress;

  StudentInfo(
      {required this.onPress, required this.iconTitle, required this.icon});
}

Widget StudentInfoGridView(BuildContext context){

  List<StudentInfo> studentChoice = [
    StudentInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/Attendance.jpg',
      ),
      iconTitle: 'Student\n'
          'Attendance',
      onPress: () {
        print('student attendance');
        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAttendance()));
      },
    ),
    StudentInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/attendance_report.jpg',
      ),
      iconTitle: 'Attendance\n'
          'Report',
      onPress: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AttendanceReport()));
      },
    ),
    StudentInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/attendance_summary.jpg',
      ),
      iconTitle: 'Attendance\n'
          'Summary',
      onPress: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AttendanceSummary()));
      },
    ),
  ];

  return Container(
    padding: EdgeInsets.only(bottom: 5),
    margin: EdgeInsets.symmetric(vertical: 5),
    height: MediaQuery.of(context).size.height * 0.23,
    child: Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'STUDENT INFO',
            style: headingTitle
          ),
          SizedBox(
            height: 3.0,
          ),
          Flexible(
            child: GridView.count(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              crossAxisCount: 1,
              children: List.generate(studentChoice.length, (index) {
                var studentDetails = studentChoice[index];
                return Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: orangeOne,
                            spreadRadius: 1,
                            blurRadius: 4,
                            blurStyle: BlurStyle.inner,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: Center(
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () =>
                                studentDetails.onPress(),
                            icon: studentDetails.icon,
                            iconSize: 50,
                          ),
                          Text(
                            studentDetails.iconTitle,
                            style: iconTitle,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    ),
  );
}