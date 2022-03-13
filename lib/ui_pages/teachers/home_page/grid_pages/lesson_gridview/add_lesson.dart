import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/homework_gridpage/add_homework.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/homework_gridpage/homework_list.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/homework_gridpage/homework_list_table.dart';

class AddLesson extends StatelessWidget {
  const AddLesson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeworkList(
      title: 'Lesson',
      title2: 'Lesson List',
      buttonTitle: 'See Lesson Plan',
      onPress: () {
        print('anything');
        Get.to(() => HomeworkListTable(
            title: 'Lesson',
            title2: 'Lesson List',
          editOnPress: () => Get.to(() =>
              AddHomework(
                mainTitle: 'Lesson List',
              title: 'Edit Lesson List',
              buttonTitle: 'See Lesson List',
              onPress: () {
                Get.to(() => HomeworkListTable(
                  title: 'Lesson List',
                  title2: 'Lesson List Edited',
                  containerColor: Colors.green.shade300,
                  textColor: Colors.white,
                  editOnPress: (){},
                  deleteOnPress: (){},
                ));
              }) ),
          deleteOnPress: () => Get.to(() => AddHomework(
              mainTitle: 'Lesson List',
              title: 'Edit Lesson List',
              buttonTitle: 'See Lesson List',
              onPress: () {
                Get.to(() => HomeworkListTable(
                  title: 'Lesson List',
                  title2: 'Lesson List Deleted',
                  containerColor: Colors.red.shade300,
                  textColor: Colors.white,
                  editOnPress: (){},
                  deleteOnPress: (){},
                ));
              }) ),
        ));
      }
    );
  }
}
