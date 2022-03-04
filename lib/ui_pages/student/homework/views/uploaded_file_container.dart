import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:new_project_work/ui_pages/student/homework/controller/student_homework_controller.dart';
import 'package:new_project_work/ui_pages/student/homework/model/student_homework_model.dart';
import 'package:new_project_work/utils/color.dart';

class StudentUploadedFile extends StatelessWidget {
  StudentUploadedFile({Key? key, required this.imagepath, required this.myitem})
      : super(key: key);

  final StudentHomeworkController studentHomeworkController =
      Get.find<StudentHomeworkController>();

  final XFile imagepath;
  final StudentHomeWorkData myitem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 90,
            child: Image.file(File(imagepath.path)),
          ),
          SizedBox(
            height: 30,
            width: 90,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                      child: studentHomeworkController.isUploading.value
                          ? CircularProgressIndicator()
                          : const Icon(
                              IconData(0xe695, fontFamily: 'MaterialIcons')),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(pink),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(color: pink)))),
                      onPressed: () {
                        studentHomeworkController.uploadImage(
                            myitem.id, imagepath);
                      }),
                ),
                const SizedBox(
                  width: 3.0,
                ),
                SizedBox(
                  width: 35.0,
                  height: 33.0,
                  child: Center(
                    child: TextButton(
                      child: Icon(
                        const IconData(0xe1b9, fontFamily: 'MaterialIcons'),
                        color: pink,
                        size: 22.0,
                      ),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(pink),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(color: pink)))),
                      onPressed: () {
                        studentHomeworkController.imageFileList
                            .remove(imagepath);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
