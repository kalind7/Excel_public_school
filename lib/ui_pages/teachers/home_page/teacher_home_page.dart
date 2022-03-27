import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_attendance_controller.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_image_picker_controller.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_profile_controller.dart';
import 'package:new_project_work/ui_pages/teachers/drawer/teacher_drawer.dart';
import 'package:new_project_work/ui_pages/teachers/profile/teacher_profile.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/teacher_widgets/homepage_gridviews/exam_info_teacher_gridview_homepage.dart';
import 'package:new_project_work/widgets/teacher_widgets/homepage_gridviews/homework_teacher_gridview_homepage.dart';
import 'package:new_project_work/widgets/teacher_widgets/homepage_gridviews/leave_gridview_homepage.dart';
import 'package:new_project_work/widgets/teacher_widgets/homepage_gridviews/lessonplan_teacher_gridview_homepage.dart';
import 'package:new_project_work/widgets/teacher_widgets/homepage_gridviews/teacher_gridview_homepage.dart';
import 'package:new_project_work/widgets/teacher_widgets/row_data_teacherDetails.dart';
import 'package:new_project_work/widgets/teacher_widgets/homepage_gridviews/student_info_teacher_gridview_homepage.dart';

class TeacherHomePage extends StatelessWidget {
  TeacherHomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TeacherProfileController profileController = Get.find();
  TeacherImageController imageController = Get.find();


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppbar(
          icon: Icons.menu,
          title: '',
          onPress: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      drawer: TeacherDrawer(),
      body: BodyWithWidgetContainer(
        top: 100,
        upperWidget:Container(
          height: height * 0.23,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: orangeOne,
                  // spreadRadius: 5,
                  blurRadius: 4,
                  blurStyle: BlurStyle.inner,
                  offset: const Offset(0, 3),
                ),
              ]),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Obx(() => CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade100,
                  backgroundImage:imageController.isImagePathSet.value == true
                      ? FileImage(File(imageController.profilePicPath.value)) as ImageProvider
                      : AssetImage('images/profile.png'),
                ),),
              ),
              SizedBox(
                width: 20,
                height: 70,
                child: VerticalDivider(
                  width: 2,
                  thickness: 2,
                  color: pink,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child:  Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profileController.name.toString(), style: nameTitle),

                    profileController.qualification.toString() == "" ?  SizedBox(): RowData(
                        text: 'Qualification',
                        differentiator: ':',
                        answer: profileController.qualification.toString() ,
                        height: 10),
                    profileController.experience.toString() == "" ? SizedBox() :RowData(
                        text: 'Experience',
                        differentiator: ':',
                        answer: profileController.experience.toString(),
                        height: 10)  ,
                    RowData(
                        text: 'Address',
                        differentiator: ':',
                        answer: profileController.currentAddress.toString(),
                        height: 10),
                    Center(
                      child: InkWell(
                          onTap: () {
                            Get.to(() => TeacherProfile());
                          },
                          child: Hero(
                            transitionOnUserGestures: true,
                            tag: 'heroTag',
                            child: Text(
                              'View More',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline),
                            ),
                          )),
                    )
                  ],
                ),),
              ),
            ],
          ),
        ),
        bodyWidget: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          children: [
            SizedBox(
              height: 5,
            ),
            StudentInfoGridView(context),
            ExamInfoGridView(context),
            HomeworkInfoGridView(context),
            LessonInfoGridView(context),
            TeacherInfoGridView(context),
            LeaveInfoGridView(context),
          ],
        ),
      ),
    );
  }
}