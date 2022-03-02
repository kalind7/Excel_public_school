import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/homework/controller/student_homework_controller.dart';
import 'package:new_project_work/utils/color.dart';

Widget uploadPopUp(BuildContext context) {
  final StudentHomeworkController studentHomeworkController =
      Get.find<StudentHomeworkController>();
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Dialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      height: height * 0.5,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
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
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 2.0),
            padding: EdgeInsets.only(left: width / 3.5, right: 7),
            height: height * 0.09,
            decoration: BoxDecoration(
              color: pink,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upload',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                  ),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
            child: GestureDetector(
              onTap: () {
                studentHomeworkController.pickImage();
              },
              child: SvgPicture.asset(
                'assets/homework_icons/Vector.svg',
                height: 115,
                width: 115,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
