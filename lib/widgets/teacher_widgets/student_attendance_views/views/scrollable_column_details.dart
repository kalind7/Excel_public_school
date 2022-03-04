import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/controller/student_attendance_controller.dart';

class ScrollableColumnView extends StatefulWidget {
  const ScrollableColumnView({Key? key}) : super(key: key);

  @override
  _ScrollableColumnViewState createState() => _ScrollableColumnViewState();
}

class _ScrollableColumnViewState extends State<ScrollableColumnView> {

  StudentAttendanceController attendanceController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Flexible(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            border: TableBorder(right: BorderSide(width: 0.5, color: Colors.grey)),
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
                  label: Padding(padding: EdgeInsets.only(left: 15.0),child: Text('P',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.green.shade300,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto')))),
              DataColumn(
                  label:  Padding(padding: EdgeInsets.only(left: 15.0),child: Text('A',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red.shade300,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto')))),
              DataColumn(
                  label:  Padding(padding: EdgeInsets.only(left: 15.0),child: Text('H',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange.shade300,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto')))),
            ],
            rows: [
              ...attendanceController.studentAttendanceList.map((attendance) =>
                  DataRow(
                    cells: [
                      DataCell(
                        Container(
                          alignment: AlignmentDirectional.center,
                          child: Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.green),
                            checkColor: Colors.green,
                            shape: CircleBorder(),
                            value: attendance.present,
                            onChanged: (newValue) {
                              setState(() {
                                attendance.present = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: Checkbox(
                          fillColor: MaterialStateProperty.all(Colors.red),
                          checkColor: Colors.red,
                          shape: CircleBorder(),
                          value: attendance.absent,
                          onChanged: (newValue) {
                            setState(() {
                              attendance.absent = newValue!;
                            });
                          }
                        ),
                      )),
                      DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: Checkbox(
                          fillColor: MaterialStateProperty.all(Colors.orange),
                          checkColor: Colors.orange,
                          shape: CircleBorder(),
                          value: attendance.homework,
                          onChanged: ( newValue) {
                            setState(() {
                              attendance.homework = newValue!;
                            });
                          }

                        ),
                      )),
                    ],
                  ))
            ]),
      ),
    ),
    );
  }
}


// Obx(() => Flexible(
//       flex: 2,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: DataTable(
//             border: TableBorder(right: BorderSide(width: 0.5, color: Colors.grey)),
//             showCheckboxColumn: false,
//             showBottomBorder: true,
//             headingRowColor: MaterialStateProperty.all(Colors.green[100]),
//             columnSpacing: 40,
//             decoration: BoxDecoration(
//               border: Border(
//                 right: BorderSide(
//                   color: Colors.grey,
//                   width: 0.5,
//                 ),
//               ),
//             ),
//             columns: [
//               DataColumn(
//                   label: Padding(padding: EdgeInsets.only(left: 15.0),child: Text('P',
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.green.shade300,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'Roboto')))),
//               DataColumn(
//                   label:  Padding(padding: EdgeInsets.only(left: 15.0),child: Text('A',
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.red.shade300,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'Roboto')))),
//               DataColumn(
//                   label:  Padding(padding: EdgeInsets.only(left: 15.0),child: Text('H',
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.orange.shade300,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'Roboto')))),
//             ],
//             rows: [
//               ...attendanceController.studentAttendanceList.map((attendance) =>
//                   DataRow(
//                     cells: [
//                       DataCell(
//                         Container(
//                           alignment: AlignmentDirectional.center,
//                           child: Checkbox(
//                             fillColor: MaterialStateProperty.all(Colors.green),
//                             checkColor: Colors.green,
//                             shape: CircleBorder(),
//                             value: attendance.present,
//                             onChanged: (newValue) => attendance.present = newValue! ,
//                           ),
//                         ),
//                       ),
//                       DataCell(Container(
//                         alignment: AlignmentDirectional.center,
//                         child: Checkbox(
//                             fillColor: MaterialStateProperty.all(Colors.red),
//                             checkColor: Colors.red,
//                           shape: CircleBorder(),
//                           value: attendance.absent,
//                           onChanged: (newValue) => attendance.absent = newValue!,
//                         ),
//                       )),
//                       DataCell(Container(
//                         alignment: AlignmentDirectional.center,
//                         child: Checkbox(
//                             fillColor: MaterialStateProperty.all(Colors.orange),
//                             checkColor: Colors.orange,
//                           shape: CircleBorder(),
//                           value: attendance.homework,
//                           onChanged: ( newValue) => attendance.homework = newValue!,
//
//                         ),
//                       )),
//                     ],
//                   ))
//             ]),
//       ),
//     ),)