import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:new_project_work/ui_pages/student/homework/controller/student_homework_controller.dart';
import 'package:new_project_work/ui_pages/student/homework/views/image_chooser_sheet.dart';

import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/teacher_widgets/row_data_teacherDetails.dart';

class TeacherDetails extends StatelessWidget {
  TeacherDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppbar(
          icon: Icons.arrow_back,
          title: 'Teacher Details',
          onPress: () {
            Get.back();
          },
        ),
      ),
      body: BodyWithWidgetContainer(
        top: 85,
        upperWidget: Center(
            child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                radius: 60,
                backgroundImage: AssetImage('images/excellogo.png'),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => PickImageButtonSheet());
                    },
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.green,
                    ),
                  )),
            ],
          ),
        )),
        bodyWidget: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              // padding: EdgeInsets.only(top: 70),
              height: height * 0.6,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: orangeOne,
                      spreadRadius: 1.5,
                      blurRadius: 4,
                      blurStyle: BlurStyle.inner,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: Hero(
                  transitionOnUserGestures: true,
                  tag: 'heroTag',
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Belli Lama',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: pink),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('belli@excelpublischool.edu.np',
                              style: eventDescription),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Divider(
                              height: 1,
                              thickness: 1,
                              color: pink,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RowData(
                                text: 'Role',
                                differentiator: ':',
                                answer: 'Teacher',
                                height: 10),
                            RowData(
                                text: 'Designation',
                                differentiator: ':',
                                answer: 'Teacher',
                                height: 10),
                            RowData(
                                text: 'Department',
                                differentiator: ':',
                                answer: 'Academic',
                                height: 10),
                            RowData(
                                text: 'Date of Joining',
                                differentiator: ':',
                                answer: '1st Jan,2022',
                                height: 10),
                            RowData(
                                text: 'Phone No.',
                                differentiator: ':',
                                answer: '9874561230',
                                height: 10),
                            RowData(
                                text: 'DOB',
                                differentiator: ':',
                                answer: '1st Jan,1970',
                                height: 10),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
