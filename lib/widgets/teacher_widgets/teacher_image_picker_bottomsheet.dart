import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_image_picker_controller.dart';
import 'package:new_project_work/utils/color.dart';

// ignore: must_be_immutable
class TeacherBottomSheet extends StatelessWidget {
  TeacherBottomSheet({Key? key}) : super(key: key);

  TeacherImageController teacherController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      height: size.height * 0.2,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Choose Photo',
            style: TextStyle(
                fontSize: 18,
                color: pink,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      teacherController.pickImage(ImageSource.gallery);
                      print('Gallery');
                    },
                    color: orangeOne,
                    iconSize: 30,
                    icon: Icon(Icons.image),
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(
                        fontSize: 18,
                        color: pink,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      teacherController.pickImage(ImageSource.camera);
                      print('Camera');
                    },
                    color: orangeOne,
                    iconSize: 30,
                    icon: Icon(Icons.camera),
                  ),
                  Text(
                    'Camera',
                    style: TextStyle(
                        fontSize: 18,
                        color: pink,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}