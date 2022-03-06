import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/homepage/controller/student_home_controller.dart';
import 'package:new_project_work/ui_pages/student/widget/profile_body_container.dart';
import 'package:new_project_work/ui_pages/student/widget/row_details.dart';

import 'package:new_project_work/utils/color.dart';

class StudentDetails extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final studentHomeController = Get.put(StudentHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      body: Obx(
        () => ProfileBodyContainer(
            widget: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      VerticalDivider(
                        width: 3,
                        thickness: 5,
                        color: orangeOne,
                      ),
                      VerticalDivider(
                        width: 3,
                        thickness: 5,
                        color: orangeOne,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                          top: const Radius.circular(10),
                          bottom: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: orangeOne,
                          // spreadRadius: 5,
                          blurRadius: 4,
                          blurStyle: BlurStyle.inner,
                          offset: const Offset(0, 3),
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      rowDetails(
                          titleText: 'Class',
                          answerText:
                              studentHomeController.className.toString()),
                      rowDetails(
                          titleText: 'Section',
                          answerText: studentHomeController.section.toString()),
                      rowDetails(
                          titleText: 'Email',
                          answerText: studentHomeController.email.toString()),
                      rowDetails(
                          titleText: 'Adminssion No',
                          answerText:
                              studentHomeController.admissionNumber.toString()),
                    ],
                  ),
                ),
              ],
            ),
            text: studentHomeController.name.toString(),
            // text: studentHomeController.name.toString(),
            image: 'images/excellogo.png'),
      ),
    );
  }
}