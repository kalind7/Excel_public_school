import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance/controller/student_attendance_controller.dart';

class FixedColumnWidget extends StatelessWidget {
  FixedColumnWidget({Key? key}) : super(key: key);

  final attendanceController = Get.put(StudentAttendanceController());

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showBottomBorder: true,
      horizontalMargin: 10,
      columnSpacing: 20,
      headingRowColor: MaterialStateProperty.all(pink),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 0.5,color: Colors.grey),
          right: BorderSide(width: 0.5,color: Colors.grey),
        ),
      ),
      columns: [
        // DataColumn(label: Text('Roll No')),
        // DataColumn(label: SizedBox(width: 5.0,)),
        DataColumn(label: Text('Name')),
      ],
      rows: [
        ...attendanceController.studentAttendanceList
            .map((attendance) => DataRow(
          cells: [
            DataCell(Text(
              '${attendance.roll.toString()}  ${attendance.stdName} ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: pink,
                fontFamily: 'Roboto',
              ),
            )),
            // DataCell(SizedBox(width: 5.0,) ),
            // DataCell(
            //     Text(
            //   '${attendance.stdName} ',
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.w600,
            //     color: pink,
            //     fontFamily: 'Roboto',
            //   ),
            // ),
            //
            // ),
          ],
        )).toList(),
      ],
    );
  }
}
