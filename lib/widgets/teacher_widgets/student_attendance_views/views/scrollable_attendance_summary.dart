import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/controller/teacher_attendance_controller.dart';

// ignore: must_be_immutable
class ScrollableAttendanceSummary extends StatelessWidget {
  ScrollableAttendanceSummary({Key? key, this.color}) : super(key: key);




  TeacherAttendanceController attendanceController = Get.find();

  Color ? color;

  TextStyle textStyle =  TextStyle(
      fontSize: 16,
      color: Colors.black54,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto');

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Flexible(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
              border: TableBorder(
                  right: BorderSide(width: 0.5, color: Colors.grey)),
              showCheckboxColumn: false,
              showBottomBorder: true,
              headingRowColor: MaterialStateProperty.all(color == null ? Colors.grey.shade300 : color),
              columnSpacing: 40,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              columns: [
                DataColumn(
                  label: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        print('tapped');
                      },
                      child: Text('Present',
                          style: textStyle ),
                    ),
                  ),
                ),
                DataColumn(
                    label: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text('Absent',
                            style:textStyle))),
                DataColumn(
                    label: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text('Total',
                            style: textStyle))),

              ],
              rows: [
                ...attendanceController.studentClassList
                    .map((attendance) => DataRow(
                  cells: [
                    DataCell(
                      Container(
                          padding: EdgeInsets.only(left: 5),
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            '${attendance.className}',
                            style: TextStyle(
                                color: Colors.blueGrey.shade300,
                                fontSize: 16),
                          )),
                    ),
                    DataCell(
                      Container(
                          padding: EdgeInsets.only(left: 5),
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            '${attendance.className}',
                            style: TextStyle(color: Colors.blueGrey.shade300, fontSize: 16),
                          )),
                    ),
                    DataCell(Container(
                        padding: EdgeInsets.only(left: 5),
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          '${attendance.className}',
                          style: TextStyle(
                              color: Colors.blueGrey.shade300, fontSize: 16),
                        ))),
                  ],
                ))
              ]),
        ),
      ),
    );
  }
}
