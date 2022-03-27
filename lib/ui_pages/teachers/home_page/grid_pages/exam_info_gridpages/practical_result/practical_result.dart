import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/practical_exam/practical_exam.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/practical_result/table_practical_result.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_attendance_controller.dart';

class PracticalResult extends StatelessWidget {
   PracticalResult({Key? key}) : super(key: key);

  TeacherAttendanceController attendanceController = Get.put(TeacherAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ExamPractical(
        secondTitle: 'Class Overall Result',
        title: 'Practical Result',
        widget: SizedBox(),
        buttonHeader: 'Search Result',
        onPress: (){Get.to(PracticalResultTable());},
      ),
    );
  }
}
