import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:new_project_work/ui_pages/teachers/controller/teacher_attendance_controller.dart';

class ClasswiseScrollablePracticalTable extends StatefulWidget {
  const ClasswiseScrollablePracticalTable({Key? key}) : super(key: key);

  @override
  _ClasswiseScrollablePracticalTableState createState() =>
      _ClasswiseScrollablePracticalTableState();
}

class _ClasswiseScrollablePracticalTableState
    extends State<ClasswiseScrollablePracticalTable> {
  TeacherAttendanceController attendanceController =
      Get.put(TeacherAttendanceController());

  TextStyle headerStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
    color: Colors.blue.shade300,
  );
  TextStyle textStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
    color: Colors.black54,
  );

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
              headingRowColor: MaterialStateProperty.all(Colors.grey.shade300),
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
                  label: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 0.5, color: Colors.black54)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('English', style: headerStyle),
                            SizedBox(
                              height: 2,
                            ),
                            Text('(100/40)', style: textStyle),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'TH/75',
                              style: textStyle,
                            ),
                            SizedBox(
                              width: 12.5,
                            ),
                            Text(
                              'PR/25',
                              style: textStyle,
                            ),
                            SizedBox(
                              width: 12.5,
                            ),
                            Text(
                              'TOT/100',
                              style: textStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                    label: Container(
                     padding: EdgeInsets.only(right: 30),
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 0.5, color: Colors.black54)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('Nepali', style: headerStyle),
                          SizedBox(
                            height: 2,
                          ),
                          Text('(100/40)', style: textStyle),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'TOT/100',
                            style: textStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                DataColumn(
                  label: Container(
                    padding: EdgeInsets.only(right: 30),
                    decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 0.5, color: Colors.black54)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('Maths', style: headerStyle),
                            SizedBox(
                              height: 2,
                            ),
                            Text('(100/40)', style: textStyle),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'TOT/100',
                              style: textStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Container(
                    padding: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 0.5, color: Colors.black54)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('Computer', style: headerStyle),
                            SizedBox(
                              height: 2,
                            ),
                            Text('(100/40)', style: textStyle),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'TH/50',
                              style: textStyle,
                            ),
                            SizedBox(
                              width: 12.5,
                            ),
                            Text(
                              'PR/50',
                              style: textStyle,
                            ),
                            SizedBox(
                              width: 12.5,
                            ),
                            Text(
                              'TOT/100',
                              style: textStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Container(
                    padding: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 0.5, color: Colors.black54)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('G.K', style: headerStyle),
                            SizedBox(
                              height: 2,
                            ),
                            Text('(50/20)', style: textStyle),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'TH/40',
                              style: textStyle,
                            ),
                            SizedBox(
                              width: 12.5,
                            ),
                            Text(
                              'PR/10',
                              style: textStyle,
                            ),
                            SizedBox(
                              width: 12.5,
                            ),
                            Text(
                              'TOT/50',
                              style: textStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('Science', style: headerStyle),
                            SizedBox(
                              height: 2,
                            ),
                            Text('(100/40)', style: textStyle),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'TH/75',
                              style: textStyle,
                            ),
                            SizedBox(
                              width: 12.5,
                            ),
                            Text(
                              'PR/25',
                              style: textStyle,
                            ),
                            SizedBox(
                              width: 12.5,
                            ),
                            Text(
                              'TOT/100',
                              style: textStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
              rows: [
                ...attendanceController.teacherAttendanceList
                    .map((attendance) => DataRow(
                          cells: [
                            DataCell(
                              Container(
                                alignment: AlignmentDirectional.centerStart,
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 0.5, color: Colors.black54)),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '60',
                                      style: textStyle,
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      '20',
                                      style: textStyle,
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      '80',
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                alignment: AlignmentDirectional.centerStart,
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 0.5, color: Colors.black54)),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '80',
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                alignment: AlignmentDirectional.centerStart,
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 0.5, color: Colors.black54)),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '80',
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                alignment: AlignmentDirectional.centerStart,
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 0.5, color: Colors.black54)),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '60',
                                      style: textStyle,
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      '20',
                                      style: textStyle,
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      '80',
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                alignment: AlignmentDirectional.centerStart,
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 0.5, color: Colors.black54)),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '40',
                                      style: textStyle,
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      '10',
                                      style: textStyle,
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      '50',
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                alignment: AlignmentDirectional.centerStart,

                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '60',
                                      style: textStyle,
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      '20',
                                      style: textStyle,
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      '80',
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))
              ]),
        ),
      ),
    );
  }
}
