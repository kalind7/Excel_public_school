import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/library.dart';
import 'package:new_project_work/ui_pages/student/attendance/views/student_attendance.dart';
import 'package:new_project_work/ui_pages/student/routine/routine.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/teacher_home_page.dart';
import 'package:new_project_work/utils/fonts.dart';

import '../ui_pages/fees/views/fees.dart';

class Model {
  final String text;
  final String iconTitle;
  final Function onPress;

  Model({required this.text, required this.iconTitle, required this.onPress});
}

class Gridview extends StatelessWidget {
  const Gridview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Model> model = [
      Model(
        text: 'Online Class',
        iconTitle: 'assets/gridview_logo/onlineClass.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Fees',
        iconTitle: 'assets/gridview_logo/fees.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
            Get.to(Fees());
          }
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> Fees()));
        },
      ),
      Model(
        text: 'Result',
        iconTitle: 'assets/gridview_logo/results.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Attendance',
        iconTitle: 'assets/gridview_logo/attendance.jpg',
        onPress: () {
          Get.to(StudentAttendanceView());
        },
      ),
      Model(
        text: 'Subjects',
        iconTitle: 'assets/gridview_logo/subjects.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Routine',
        iconTitle: 'assets/gridview_logo/routine.jpg',
        onPress: () {
          Get.to(Routine());
        },
      ),
      Model(
        text: 'Library',
        iconTitle: 'assets/gridview_logo/library.jpg',
        onPress: () {
          Get.to(Library());
        },
      ),
      Model(
        text: 'Online Exam',
        iconTitle: 'assets/gridview_logo/onlineExam.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Library()));
        },
      ),
      Model(
        text: 'Teachers',
        iconTitle: 'assets/gridview_logo/teacher.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          Get.to(TeacherHomePage());
        },
      ),
      Model(
        text: 'Dormitory',
        iconTitle: 'assets/gridview_logo/dormitory.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          // Get.toNamed('/assignment');
        },
      ),
      Model(
        text: 'Transport',
        iconTitle: 'assets/gridview_logo/transport.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Download',
        iconTitle: 'assets/gridview_logo/download.png',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
    ];
    return Container(
      // height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.count(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        crossAxisCount: 4,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 5.0,
        children: List.generate(model.length, (index) {
          return Card(
            borderOnForeground: false,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 4,
            shadowColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  onPressed: () {
                    model[index].onPress();
                  },
                  icon: Image.asset(model[index].iconTitle),
                  iconSize: 30.0,
                ),
                Text(
                  model[index].text,
                  style: gridTextStyle,
                ),
              ]),
            ),
          );
        }),
      ),
    );
  }
}
