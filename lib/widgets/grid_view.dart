import 'package:excel_public_school/models/grid_view_model.dart';
import 'package:excel_public_school/ui_pages/admin_bio.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Gridview extends StatelessWidget {
  const Gridview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Model> model = [

      Model(
        text: 'Online Class',
        iconTitle: 'files/icons/onlineClass.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  AdminBio(

                ),
              ));
        },
      ),
      Model(
        text: 'Fees',
        iconTitle: 'files/icons/fees.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> Fees()));
        },
      ),
      Model(
        text: 'Result',
        iconTitle: 'files/icons/results.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Attendance',
        iconTitle: 'files/icons/attendance.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }

        },
      ),
      Model(
        text: 'Subjects',
        iconTitle: 'files/icons/subjects.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Routine',
        iconTitle: 'files/icons/routine.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Library',
        iconTitle: 'files/icons/library.jpg',
        onPress: () {
          Get.toNamed('/routine');
        },
      ),
      Model(
        text: 'Online Exam',
        iconTitle: 'files/icons/onlineExam.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Library()));
        },
      ),
      Model(
        text: 'Teachers',
        iconTitle: 'files/icons/teacher.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          // Get.toNamed('/teacherlist');
        },
      ),
      Model(
        text: 'Dormitory',
        iconTitle: 'files/icons/dorm.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          // Get.toNamed('/assignment');
        },
      ),
      Model(
        text: 'Transport',
        iconTitle: 'files/icons/bus.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Download',
        iconTitle: 'files/icons/download.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
    ];


    return  Container(
      // height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.symmetric(horizontal:10 ),
      child: GridView.count(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        crossAxisCount: 4,
        mainAxisSpacing: 20.0,
        crossAxisSpacing:5.0,
        children: List.generate(model.length, (index) {
          return  Card(
            borderOnForeground: false,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 4,
            shadowColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Column(mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed : (){model[index].onPress();},
                      icon:  Image.asset(model[index].iconTitle),
                      iconSize: 30.0,
                    ),
                    Text(model[index].text,
                      style: cardTitle,
                    ),
                  ]),
            ),

          );
        }),
      ),
    );
  }
}


