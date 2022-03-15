import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/homework_gridpage/add_homework.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/homework_gridpage/homework_list.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/homework_gridpage/homework_list_table.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';

class HomeworkInfo {
  final Widget icon;
  final String iconTitle;
  final Function onPress;

  HomeworkInfo(
      {required this.onPress, required this.iconTitle, required this.icon});
}

Widget HomeworkInfoGridView(BuildContext context) {
  List<HomeworkInfo> homeworkChoice = [
    HomeworkInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/add_homework.png',
      ),
      iconTitle: 'Add\n'
          'Homework',
      onPress: () {
        Get.to(() => AddHomework(
              title: 'Add Homework',
              onPress: () {},
            ));
      },
    ),
    HomeworkInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/homework.png',
      ),
      iconTitle: 'Homework List',
      onPress: () {
        Get.to(() => HomeworkList(
              title: 'Homework',
              title2: 'Homework List',
              onPress: () => Get.to(() => HomeworkListTable(
                  title: 'Homework',
                  title2: 'Homework List',
                editOnPress: () {},
                deleteOnPress: () {} ,
              ),
              ),
            ));
      },
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
            'HOMEWORK INFO',
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
              children: List.generate(homeworkChoice.length, (index) {
                var homeworkDetails = homeworkChoice[index];
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
                            onPressed: () => homeworkDetails.onPress(),
                            icon: homeworkDetails.icon,
                            iconSize: 50,
                          ),
                          Text(
                            homeworkDetails.iconTitle,
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
