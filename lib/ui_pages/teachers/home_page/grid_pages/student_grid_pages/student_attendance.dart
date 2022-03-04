import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/views/fixed_column_view.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/views/scrollable_column_details.dart';


class StudentAttendance extends StatefulWidget {
  const StudentAttendance({Key? key}) : super(key: key);

  @override
  _StudentAttendanceState createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          child: WidgetAppbar(
            title: 'Attendance',
            onPress: () {},
          ),
          preferredSize: Size.fromHeight(55.0)),
      body: BodyWithWidgetContainer(
        upperWidget: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
              height: MediaQuery.of(context).size.height * 0.050,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Present: P',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        color: Colors.green.shade300),
                  ),
                  Text(
                    'Absent: A',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        color: Colors.red.shade300),
                  ),
                  Text(
                    'Homework: H',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        color: Colors.orange.shade300),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: MediaQuery.of(context).size.height * 0.070,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
        bodyWidget:  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          margin: EdgeInsets.only(bottom: 10),
          child:SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    FixedColumnWidget(),

                    ScrollableColumnView(),

                  ],
                ),

              ],
            ),
          ),
        ),


      ),

    );
  }
}

