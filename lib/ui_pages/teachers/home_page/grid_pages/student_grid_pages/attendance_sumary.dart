import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/calender/attendance_date_picker.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/drop_down/class_drop_down.dart';
import 'package:new_project_work/widgets/drop_down/section_drop_down.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/controller/teacher_attendance_controller.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/views/fixed_column_view.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/views/scrollable_attendance_view.dart';

class AttendanceSummary extends StatefulWidget {
  const AttendanceSummary({Key? key}) : super(key: key);

  @override
  _AttendanceSummaryState createState() => _AttendanceSummaryState();
}

class _AttendanceSummaryState extends State<AttendanceSummary> {
  TeacherAttendanceController attendanceController =
  Get.put(TeacherAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          child: WidgetAppbar(
            icon: Icons.arrow_back,
            title: 'Attendance Summary',
            onPress: () {
              Get.back();
            },
          ),
          preferredSize: Size.fromHeight(55.0)),
      body: BodyWithWidgetContainer(
        upperWidget: Column(
          children: [

            Container(
              padding: EdgeInsets.symmetric(horizontal: 7.0),
              margin: EdgeInsets.fromLTRB(5, 30, 5, 5),
              height: MediaQuery.of(context).size.height * 0.070,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AttendanceDatePicker(),

                  IconButton(
                    padding: EdgeInsets.only(bottom: 5.0),
                    onPressed: (){},icon: Icon(Icons.search,color: pink, size: 34,),),
                ],
              ),
            ),

          ],
        ),

        bodyWidget: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          margin: EdgeInsets.only(bottom: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    FixedColumnNameWidget(),
                    ScrollableAttendanceView(),
                  ],
                ),
                Center(
                  child: SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: pink,
                          onPrimary: Colors.white,
                          onSurface: Colors.grey,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.all(5)),
                      onPressed: () {},
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(Icons.save),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
