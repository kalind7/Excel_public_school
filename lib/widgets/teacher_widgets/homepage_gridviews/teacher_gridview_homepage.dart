import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';

class TeacherInfo {
  final Widget icon;
  final String iconTitle;
  final Function onPress;

  TeacherInfo(
      {required this.onPress, required this.iconTitle, required this.icon});
}

Widget TeacherInfoGridView(BuildContext context){

  List<TeacherInfo> teacherChoice = [
    TeacherInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/upload_content.png',
      ),
      iconTitle: 'Upload \n'
          'Content',
      onPress: () {},
    ),
    TeacherInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/assignment.png',
      ),
      iconTitle: 'Assignment',

      onPress: () {},
    ),
    TeacherInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/study_material.png',
      ),
      iconTitle: 'Study\n'
          'Material',
      onPress: () {},
    ),
    TeacherInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/Syllabus.png',
      ),
      iconTitle: 'Syllabus',
      onPress: () {},
    ),

    TeacherInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/downloads.png',
      ),
      iconTitle: 'Other\n'
          'Downloads',
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
            'TEACHER',
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
              children: List.generate(teacherChoice.length, (index) {
                var teacherDetails = teacherChoice[index];
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
                                teacherDetails.onPress(),
                            icon: teacherDetails.icon,
                            iconSize: 50,
                          ),
                          Text(
                            teacherDetails.iconTitle,
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