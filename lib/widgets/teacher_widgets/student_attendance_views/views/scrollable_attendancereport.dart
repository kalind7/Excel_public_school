import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/controller/teacher_attendance_controller.dart';

// ignore: must_be_immutable
class ScrollableAttendanceReport extends StatelessWidget {
  ScrollableAttendanceReport({Key? key}) : super(key: key);

  TeacherAttendanceController attendanceController = Get.find();

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
              headingRowColor: MaterialStateProperty.all(Colors.green[100]),
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
                      child: Text('P',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.green.shade300,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto')),
                    ),
                  ),
                ),
                DataColumn(
                    label: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text('L',
                            style: TextStyle(
                                fontSize: 18,
                                color: pink,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto')))),
                DataColumn(
                    label: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text('A',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.red.shade300,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto')))),
                DataColumn(
                    label: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text('H',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange.shade300,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto')))),
                DataColumn(
                    label: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text('%',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto')))),
              ],
              rows: [
                ...attendanceController.teacherAttendanceList
                    .map((attendance) => DataRow(
                          cells: [
                            DataCell(
                              Container(
                                  padding: EdgeInsets.only(left: 5),
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    '22',
                                    style: TextStyle(
                                        color: Colors.green.shade300,
                                        fontSize: 18),
                                  )),
                            ),
                            DataCell(
                              Container(
                                  padding: EdgeInsets.only(left: 5),
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    '1',
                                    style: TextStyle(color: pink, fontSize: 18),
                                  )),
                            ),
                            DataCell(Container(
                                padding: EdgeInsets.only(left: 5),
                                alignment: AlignmentDirectional.center,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      color: Colors.red.shade300, fontSize: 18),
                                ))),
                            DataCell(Container(
                                padding: EdgeInsets.only(left: 5),
                                alignment: AlignmentDirectional.center,
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.orange.shade300,
                                      fontSize: 18),
                                ))),
                            DataCell(Container(
                                padding: EdgeInsets.only(left: 5),
                                alignment: AlignmentDirectional.center,
                                child: Text(
                                  '93%',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 18),
                                ))),
                          ],
                        ))
              ]),
        ),
      ),
    );
  }
}
