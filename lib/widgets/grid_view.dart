import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/library.dart';
import 'package:new_project_work/ui_pages/student/attendance/views/student_attendance.dart';
import 'package:new_project_work/ui_pages/student/routine/routine.dart';


import 'package:new_project_work/ui_pages/teachers/home_page/teacher_home_page.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/teacher_landing_page.dart';
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
            print('anything');
        },
      ),
      Model(
        text: 'Fees',
        iconTitle: 'assets/gridview_logo/fees.jpg',
        onPress: () {
          Get.to(() => Fees());
        },
      ),
      Model(
        text: 'Result',
        iconTitle: 'assets/gridview_logo/results.jpg',
        onPress: () {

            print('anything');
        },
      ),
      Model(
        text: 'Attendance',
        iconTitle: 'assets/gridview_logo/attendance.jpg',
        onPress: () {
          Get.to(() => StudentAttendanceView());
        },
      ),
      Model(
        text: 'Subjects',
        iconTitle: 'assets/gridview_logo/subjects.jpg',
        onPress: () {

            print('anything');

        },
      ),
      Model(
        text: 'Routine',
        iconTitle: 'assets/gridview_logo/routine.jpg',
        onPress: () {
          Get.to(() => Routine());
        },
      ),
      Model(
        text: 'Library',
        iconTitle: 'assets/gridview_logo/library.jpg',
        onPress: () {
          Get.to(() => Library());
        },
      ),
      Model(
        text: 'Online Exam',
        iconTitle: 'assets/gridview_logo/onlineExam.jpg',
        onPress: () {

            print('anything');

        },
      ),
      // Model(
      //   text: 'Teachers',
      //   iconTitle: 'assets/gridview_logo/teacher.jpg',
      //   onPress: () {
      //     if (kDebugMode) {
      //       print('anything');
      //     }
      //     Get.to(() => TeacherLandingPage());
      //
      //   },
      // ),
      Model(
        text: 'Dormitory',
        iconTitle: 'assets/gridview_logo/dormitory.jpg',
        onPress: () {
            print('anything');
        },
      ),
      Model(
        text: 'Transport',
        iconTitle: 'assets/gridview_logo/transport.jpg',
        onPress: () {

            print('anything');

        },
      ),
      Model(
        text: 'Download',
        iconTitle: 'assets/gridview_logo/download.png',
        onPress: () {

            print('anything');

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
          var myModel = model[index];
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
                    myModel.onPress();
                  },
                  icon: Image.asset(myModel.iconTitle),
                  iconSize: 30.0,
                ),
                Text(
                  myModel.text,
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
