import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/student/drawer/student_drawer.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/ui_pages/teachers/drawer/teacher_drawer.dart';
import 'package:new_project_work/ui_pages/teachers/profile/teacher_profile.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/teacher_widgets/homepage_gridviews/exam_info_teacher_gridview_homepage.dart';
import 'package:new_project_work/widgets/teacher_widgets/homepage_gridviews/homework_teacher_gridview_homepage.dart';
import 'package:new_project_work/widgets/teacher_widgets/homepage_gridviews/leave_gridview_homepage.dart';
import 'package:new_project_work/widgets/teacher_widgets/homepage_gridviews/lessonplan_teacher_gridview_homepage.dart';
import 'package:new_project_work/widgets/teacher_widgets/homepage_gridviews/teacher_gridview_homepage.dart';
import 'package:new_project_work/widgets/teacher_widgets/row_data_teacherDetails.dart';
import 'package:new_project_work/widgets/teacher_widgets/homepage_gridviews/student_info_teacher_gridview_homepage.dart';

class TeacherHomePage extends StatelessWidget {
  TeacherHomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppbar(
          icon: Icons.menu,
          title: '',
          onPress: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      drawer: TeacherDrawer(),
      body: BodyWithWidgetContainer(

        top: 100,
        upperWidget: Container(
          height: height * 0.23,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: orangeOne,
                  // spreadRadius: 5,
                  blurRadius: 4,
                  blurStyle: BlurStyle.inner,
                  offset: const Offset(0, 3),
                ),
              ]),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade100,
                  child: Image(
                    height: 75,
                    width: 75,
                    image: AssetImage('images/allstart.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
                height: 70,
                child: VerticalDivider(
                  width: 2,
                  thickness: 2,
                  color: pink,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Beli Lama', style: nameTitle),
                    RowData(
                      text: 'Role',
                      differentiator: ':',
                      answer: 'Teacher',
                      height: 7,
                    ),
                    RowData(
                      text: 'Designation',
                      differentiator: ':',
                      answer: 'Teacher',
                      height: 7,
                    ),
                    RowData(
                      text: 'Department',
                      differentiator: ':',
                      answer: 'Academic',
                      height: 7,
                    ),
                    Center(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TeacherDetails()));
                          },
                          child: Hero(
                            tag: 'heroTag',
                            child: Text(
                              'View More',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bodyWidget: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          children: [
            SizedBox(height: 5,),

            StudentInfoGridView(context),

            ExamInfoGridView(context),

            HomeworkInfoGridView(context),

            LessonInfoGridView(context),

            TeacherInfoGridView(context),

            LeaveInfoGridView(context),

          ],
        ),
      ),
    );
  }
}


