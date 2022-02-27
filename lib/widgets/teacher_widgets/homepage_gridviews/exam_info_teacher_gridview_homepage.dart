import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';

class ExamInfo {
  final Widget icon;
  final String iconTitle;
  final Function onPress;

  ExamInfo(
      {required this.onPress, required this.iconTitle, required this.icon});
}

Widget ExamInfoGridView(BuildContext context){

  List<ExamInfo> examChoice = [
    ExamInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/add_exam_practical.png',
      ),
      iconTitle: 'Add Exam\n'
          'Practical',
      onPress: () {},
    ),
    ExamInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/Exam.png',
      ),
      iconTitle: 'Practical\n'
          'Result',
      onPress: () {},
    ),
    ExamInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/assign_marks.png',
      ),
      iconTitle: 'Assign\n'
          'Marks',
      onPress: () {},
    ),
    ExamInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/Student Male.png',
      ),
      iconTitle: 'ECA\n'
          'Grades',
      onPress: () {},
    ),
    ExamInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/classwise_result.png',
      ),
      iconTitle: 'Classwise\n'
          'Result',
      onPress: () {},
    ),
    ExamInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/classwise_eca.png',
      ),
      iconTitle: 'Classwise\n'
          'ECA Result',
      onPress: () {},
    ),
    ExamInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/exam_remarks.png',
      ),
      iconTitle: 'Exam\n'
          'Remarks',
      onPress: () {},
    ),
  ];

  return Container(
    padding: EdgeInsets.only(bottom: 5),
    margin: EdgeInsets.symmetric(vertical: 5),
    height: MediaQuery.of(context).size.height * 0.23,
    child: Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EXAMINATION INFO',
            style: headingTitle,
          ),
          SizedBox(
            height: 3.0,
          ),
          Flexible(
            child: GridView.count(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              crossAxisCount: 1,
              children: List.generate(examChoice.length, (index) {
                var examDetails = examChoice[index];
                return Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: orangeOne,
                            spreadRadius: 1,
                            blurRadius: 4,
                            blurStyle: BlurStyle.inner,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: Center(
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () =>
                                examDetails.onPress(),
                            icon: examDetails.icon,
                            iconSize: 50,
                          ),
                          Text(
                            examDetails.iconTitle,
                            style: iconTitle,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    ),
  );
}