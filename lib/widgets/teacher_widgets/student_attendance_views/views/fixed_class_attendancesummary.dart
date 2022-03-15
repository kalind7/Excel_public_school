import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/controller/teacher_attendance_controller.dart';

class FixedClassAttendanceSummary extends StatefulWidget {
  FixedClassAttendanceSummary({Key? key,this.textStyle ,this.color, this.textColor}) : super(key: key);

  TextStyle ? textStyle;
  Color ? color;
  Color ? textColor;

  @override
  _FixedClassAttendanceSummaryState createState() => _FixedClassAttendanceSummaryState();
}

class _FixedClassAttendanceSummaryState extends State<FixedClassAttendanceSummary> {

  TeacherAttendanceController attendanceController = Get.put(TeacherAttendanceController());

  int ? sortColumnIndex;
  bool isAscending = false;


  @override
  Widget build(BuildContext context) {
    return
      Obx(() => Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: DataTable(
          sortAscending: isAscending,
          sortColumnIndex: sortColumnIndex,
          showBottomBorder: true,
          horizontalMargin: 10,
          columnSpacing: 20,
          headingRowColor: MaterialStateProperty.all(widget.color == null ? pink : widget.color),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(width: 0.5,color: Colors.grey),
              right: BorderSide(width: 0.5,color: Colors.grey),
            ),
          ),
          columns: [
            DataColumn(
              label: Text('Class',style: widget.textStyle == null ? homeworkTitle : widget.textStyle),
              onSort: onSort,
            ),
          ],
          rows: [
            ...attendanceController.studentClassList
                .map((attendance) =>
                DataRow(
                  cells: [
                    DataCell(
                        Text(
                          '${attendance.className}',
                          style:  TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: widget.textColor == null ? pink : widget.textColor,
                            fontFamily: 'Roboto',
                          ),
                        )),

                  ],
                )).toList(),
          ],
        ),
      ),);
  }

  void onSort(int columnIndex, bool ascending){
    setState(() {

      if(columnIndex ==0){
        attendanceController.studentClassList.sort((user1, user2) =>
            compareString(ascending, user1.className, user2.className));
      }
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }
  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

}
