import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_image_picker_controller.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_profile_controller.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/teacher_widgets/row_data_teacherDetails.dart';
import 'package:new_project_work/widgets/teacher_widgets/teacher_image_picker_bottomsheet.dart';

class TeacherProfile extends StatelessWidget {
  TeacherProfile({Key? key}) : super(key: key);

  TeacherImageController imageController = Get.find();
  TeacherProfileController profileController = Get.find();

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
      body:BodyWithWidgetContainer(
        top: 85,
        upperWidget: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Stack(
                children: [

                  Obx(() => CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    radius: 60,
                    backgroundImage: imageController.isImagePathSet.value == true
                        ? FileImage(File(imageController.profilePicPath.value)) as ImageProvider
                        : AssetImage('images/profile.png'),
                  ),),

                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => TeacherBottomSheet());
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
                  child: Obx(() =>  ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            profileController.name.toString(),
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: pink),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(profileController.email.toString(),
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
                                text: 'Date of Joining',
                                differentiator: ':',
                                answer: profileController.dateOfJoining.toString(),
                                height: 10),
                            RowData(
                                text: 'Phone No.',
                                differentiator: ':',
                                answer: profileController.mobile.toString(),
                                height: 10),
                            RowData(
                                text: 'DOB',
                                differentiator: ':',
                                answer: profileController.dateOfBirth.toString(),
                                height: 10),
                            RowData(
                                text: 'Address',
                                differentiator: ':',
                                answer: profileController.currentAddress.toString(),
                                height: 10),
                          ],
                        ),
                      )
                    ],
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


