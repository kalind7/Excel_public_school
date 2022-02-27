import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/student/homework/student_homework_container.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';

class StudentHomework extends StatelessWidget {
  StudentHomework({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        key: _scaffoldKey,
        body: BodyWithWidgetContainer(
            bodyWidget: Container(
                height: MediaQuery.of(context).size.height / 1.45,
                child: ListView(
                    children: [
                  homeworkContainer(context),
                  homeworkContainer(context),
                  homeworkContainer(context),
                ])),
            uppderWidget: Row(
              children: [
                Text('from'),
                Text('to'),
              ],
            )));
  }
}
