import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/drawer/student_drawer.dart';
import 'package:new_project_work/ui_pages/student/homepage/controller/student_home_controller.dart';
import 'package:new_project_work/ui_pages/student/widget/profile_body_container.dart';
import 'package:new_project_work/ui_pages/student/widget/row_details.dart';

import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/appbar.dart';

class StudentDetails extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final studentHomeController = Get.put(StudentHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppbar(
          title: '',
          onPress: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icons.menu,
        ),
      ),
      drawer: StudentDrawer(),
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
                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 5),
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
                          widget: SizedBox(width: MediaQuery.of(context).size.width * 0.25,),
                          answerText:
                              studentHomeController.className.toString()),
                      rowDetails(
                          titleText: 'Section',
                          widget: SizedBox(width: MediaQuery.of(context).size.width * 0.2,),
                          answerText: studentHomeController.section.toString()),
                      rowDetails(
                          titleText: 'Email',
                          widget: SizedBox(width: MediaQuery.of(context).size.width * 0.25,),
                          answerText: studentHomeController.email.toString()),
                      rowDetails(
                          titleText: 'Admission No',
                          widget: SizedBox(width: MediaQuery.of(context).size.width * 0.065,),
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
