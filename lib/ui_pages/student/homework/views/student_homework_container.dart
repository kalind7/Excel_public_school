import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:new_project_work/global/alert.dart';
import 'package:new_project_work/ui_pages/student/homework/controller/student_homework_controller.dart';
import 'package:new_project_work/ui_pages/student/homework/model/student_homework_model.dart';
import 'package:new_project_work/ui_pages/student/homework/views/homework_submit.dart';
import 'package:new_project_work/ui_pages/student/homework/views/homework_view.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';

Widget homeworkContainer(BuildContext context, StudentHomeWorkData myitem) {
  final StudentHomeworkController studentHomeworkController =
      Get.find<StudentHomeworkController>();

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    height: MediaQuery.of(context).size.height * 0.27,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: orangeOne,
          spreadRadius: 0.8,
          blurRadius: 4,
          blurStyle: BlurStyle.inner,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 3),
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: HexColor('#EDF2F9'),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              myitem.subjectName.toString(),
              style: subjectTitle,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 7.0),
          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width / 1.2,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Homework Date',
                    style: homeworkTitle,
                  ),
                  Text(
                    DateFormat('yMd').format(myitem.homeworkDate).toString(),
                    style: dateTitle,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Submission Date',
                    style: homeworkTitle,
                  ),
                  Text(
                    DateFormat('yMd').format(myitem.submissionDate).toString(),
                    style: dateTitle,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 4, 20, 10),
          child: Divider(
            height: 2,
            thickness: 2,
            color: pink,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            homeworkSubItems(
                icon: Image.asset(
                  'assets/homework_icons/files.png',
                ),
                text: 'View',
                onPress: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return feesPopup(context, myitem);
                      });
                }),
            homeworkSubItems(
                icon: Image.asset('assets/homework_icons/upload.png'),
                text: 'Upload',
                onPress: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return uploadPopUp(context, myitem);
                      });
                }),
            homeworkSubItems(
                icon: Image.asset('assets/homework_icons/download.png'),
                text: 'Download',
                onPress: () {
                  myitem.file == ""
                      ? Alert.showSnackBar(
                          title: 'No files',
                          message: 'No file to download',
                          top: true)
                      : print('Dhirah');
                }),
            homeworkSubItems(
                icon: Image.asset('assets/homework_icons/submit.png'),
                text: 'Submit',
                onPress: () {
                  studentHomeworkController.seeSubmitedHomework(context, myitem.id);
                  print('Dhirah');
                }),
          ],
        )
      ],
    ),
  );
}

Widget homeworkSubItems(
    {required Widget icon,
    required String text,
    required GestureTapCallback onPress}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: [Colors.white70, orangeOne],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: onPress, icon: icon),
                Text(text,
                    style: const TextStyle(fontSize: 14, color: Colors.black)),
              ]),
        ),
      ),
    ),
  );
}
