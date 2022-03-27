import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/calender/attendance_date_picker.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_attendance_report_controller.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/drop_down/section_drop_down.dart';
import 'package:new_project_work/widgets/drop_down/year_drop_down.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_attendance_controller.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/views/fixed_attendance_report_view.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/views/scrollable_attendancereport.dart';

import '../../../../../widgets/drop_down/class_drop_down.dart';

class AttendanceReport extends StatelessWidget {
  AttendanceReport({Key? key}) : super(key: key);

  TeacherAttendanceController attendanceController = Get.put(TeacherAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        child: WidgetAppbar(
          icon: Icons.arrow_back,
          onPress: () {
            Navigator.pop(context);
          },
          title: 'Attendance Report',
        ),
        preferredSize: Size.fromHeight(55.0),
      ),
      body: BodyWithWidgetContainer(
        upperWidget: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
              height: MediaQuery.of(context).size.height * 0.090,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Colors.pink,
                            size: 34.0,
                          )),
                      ClassDropDown(
                        value: 0.27,
                        expanded: false,
                        iconSize: 24,
                      ),
                      SectionDropDown(
                        value: 0.29,
                        expanded: false,
                        iconSize: 24,
                      ),
                      YearDropDown(
                        value: 0.27,
                        expanded: false,
                        iconSize: 24,
                      ),
                      AttendanceDatePicker(),
                    ],
                  ),
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
            child: Obx(
              () => attendanceController.isLoading.value
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Class -',
                              style: reportHeader,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Section',
                              style: reportHeader,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Month,',
                              style: reportHeader,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'Year',
                              style: reportHeader,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Present: P',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  color: Colors.green.shade300),
                            ),
                            Text(
                              'Absent: A',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  color: Colors.red.shade300),
                            ),
                            Text(
                              'Late: L',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  color: pink),
                            ),
                            Text(
                              'Holiday: H',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  color: Colors.orange.shade300),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            FixedAttendanceReportView(),
                            ScrollableAttendanceReport(),
                          ],
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
