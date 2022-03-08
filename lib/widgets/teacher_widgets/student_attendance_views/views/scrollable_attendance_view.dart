import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/controller/student_attendance_controller.dart';

class ScrollableAttendanceView extends StatefulWidget {
  const ScrollableAttendanceView({Key? key}) : super(key: key);

  @override
  _ScrollableAttendanceViewState createState() => _ScrollableAttendanceViewState();
}

class _ScrollableAttendanceViewState extends State<ScrollableAttendanceView> {
  StudentAttendanceController attendanceController = Get.find();

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
                      padding: EdgeInsets.only(left: 15.0),
                      child: GestureDetector(
                        onTap: (){
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
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('A',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.red.shade300,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto')))),
                DataColumn(
                    label: Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('H',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange.shade300,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto')))),
              ],
              rows: [
                ...attendanceController.studentAttendanceList
                    .map((attendance) => DataRow(
                          cells: [
                            DataCell(
                              Container(
                                alignment: AlignmentDirectional.center,
                                child: Checkbox(
                                  fillColor:
                                      MaterialStateProperty.all(Colors.green),
                                  checkColor: Colors.green,
                                  shape: CircleBorder(),
                                  value: attendance.present,
                                  onChanged: (newValue) {
                                    setState(() {
                                      attendance.present = newValue!;
                                      attendance.absent = !newValue;
                                      attendance.homework = !newValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                            DataCell(Container(
                              alignment: AlignmentDirectional.center,
                              child: Checkbox(
                                  fillColor:
                                      MaterialStateProperty.all(Colors.red),
                                  checkColor: Colors.red,
                                  shape: CircleBorder(),
                                  value: attendance.absent,
                                  onChanged: (newValue) {
                                    setState(() {
                                      attendance.absent = newValue!;
                                      attendance.present = !newValue;
                                      attendance.homework = !newValue;
                                    });
                                  }),
                            )),
                            DataCell(Container(
                              alignment: AlignmentDirectional.center,
                              child: Checkbox(
                                  fillColor:
                                      MaterialStateProperty.all(Colors.orange),
                                  checkColor: Colors.orange,
                                  shape: CircleBorder(),
                                  value: attendance.homework,
                                  onChanged: (newValue) {
                                    setState(() {
                                      attendance.homework = newValue!;
                                      attendance.present = !newValue;
                                      attendance.absent = !newValue;
                                    });
                                  }),
                            )),
                          ],
                        ))
              ]),
        ),
      ),
    );
  }
}
