import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/fees/fees.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/teacher_home_page.dart';

import 'package:new_project_work/utils/fonts.dart';

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
        iconTitle: 'images/gridview_logo/onlineClass.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Fees',
        iconTitle: 'images/gridview_logo/fees.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Fees(),
                ));
          }
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> Fees()));
        },
      ),
      Model(
        text: 'Result',
        iconTitle: 'images/gridview_logo/results.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Attendance',
        iconTitle: 'images/gridview_logo/attendance.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Subjects',
        iconTitle: 'images/gridview_logo/subjetcs.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Routine',
        iconTitle: 'images/gridview_logo/routine.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Library',
        iconTitle: 'images/gridview_logo/library.jpg',
        onPress: () {
          // Get.toNamed('/routine');
        },
      ),
      Model(
        text: 'Online Exam',
        iconTitle: 'images/gridview_logo/onlineExam.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Library()));
        },
      ),
      Model(
        text: 'Teachers',
        iconTitle: 'images/gridview_logo/teacher.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherHomePage()));
        },
      ),
      Model(
        text: 'Dormitory',
        iconTitle: 'images/gridview_logo/dormitory.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          // Get.toNamed('/assignment');
        },
      ),
      Model(
        text: 'Transport',
        iconTitle: 'images/gridview_logo/transport.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Download',
        iconTitle: 'images/gridview_logo/download.png',
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
