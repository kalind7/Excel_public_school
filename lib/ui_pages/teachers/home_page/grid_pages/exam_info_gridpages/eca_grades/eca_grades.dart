import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/eca_grades/eca_table.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/practical_exam/practical_exam.dart';
import 'package:new_project_work/widgets/drop_down/eca_dropdown.dart';

class ECAGrades extends StatelessWidget {
  const ECAGrades({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ExamPractical(
          secondTitle: 'Exam Finalize Marks',
          title: 'ECA Grades',
        buttonHeader: 'Search Result',
        widget: SizedBox(),
        onPress: (){
            Get.to(ECATable());
        },
        widget2: ECADropDown(value: 0.8, iconSize: 35, expanded: true),
      ),
    );
  }
}
