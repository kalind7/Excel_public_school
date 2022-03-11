import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/classwise_result/classwise_table.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/practical_exam/practical_exam.dart';

class ClasswiseResult extends StatelessWidget {
  const ClasswiseResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ExamPractical(
        title: 'Classwise Result',
          secondTitle: 'Class Overall Result',
        buttonHeader: 'Search Result',
        onPress: (){
          Get.to(ClasswiseTable());
        },
        widget: SizedBox(),
        widget2: SizedBox(),
        height: 0.48,
      ),
    );
  }
}
