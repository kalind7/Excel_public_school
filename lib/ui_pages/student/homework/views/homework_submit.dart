import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/homework/controller/student_homework_controller.dart';
import 'package:new_project_work/ui_pages/student/homework/model/student_homework_model.dart';
import 'package:new_project_work/ui_pages/student/homework/views/image_chooser_sheet.dart';
import 'package:new_project_work/ui_pages/student/homework/views/uploaded_file_container.dart';
import 'package:new_project_work/utils/color.dart';

Widget uploadPopUp(BuildContext context, StudentHomeWorkData mydata) {
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
      child: Obx(
        () => Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 2.0),
              padding: studentHomeworkController.imageFileList.isNotEmpty
                  ? EdgeInsets.only(left: 20, right: 7)
                  : EdgeInsets.only(left: width / 6.5, right: 7),
              height: height * 0.09,
              decoration: BoxDecoration(
                color: pink,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  studentHomeworkController.imageFileList.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => PickImageButtonSheet());
                          },
                          child: SvgPicture.asset(
                            'assets/homework_icons/Vector.svg',
                            height: 25,
                            color: white,
                            width: 25,
                          ),
                        )
                      : SizedBox.shrink(),
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
                      studentHomeworkController.imageFileList.clear();
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
              height: height * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              )),
              child: studentHomeworkController.imageFileList.isNotEmpty
                  ? ListView(
                      children: [
                        Wrap(
                            children: List.generate(
                                studentHomeworkController.imageFileList.length,
                                (index) {
                          var imagepath =
                              studentHomeworkController.imageFileList[index];
                          return StudentUploadedFile(
                            myitem: mydata,
                            imagepath: imagepath,
                          );
                        })),
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        print('dd');
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => PickImageButtonSheet());
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
    ),
  );
}
