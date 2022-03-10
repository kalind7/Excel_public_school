import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/assign_marks/assign_marks_table.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/practical_exam/practical_exam.dart';
class AssignMarks extends StatelessWidget {
  const AssignMarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ExamPractical(
        secondTitle: 'Exam Assign Marks',
        title: 'Assign Marks',
        widget: SizedBox(),
        buttonHeader: 'Search Result',
        onPress: (){Get.to(AssignMarksTable());},
      ),
    );
  }
}
