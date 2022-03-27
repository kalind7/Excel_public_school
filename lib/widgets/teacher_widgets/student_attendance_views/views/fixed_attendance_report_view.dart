import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_attendance_report_controller.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_attendance_controller.dart';

class FixedAttendanceReportView extends StatefulWidget {
  FixedAttendanceReportView({Key? key,this.textStyle ,this.color, this.textColor}) : super(key: key);

  TextStyle ? textStyle;
  Color ? color;
  Color ? textColor;

  @override
  _FixedAttendanceReportViewState createState() => _FixedAttendanceReportViewState();
}

class _FixedAttendanceReportViewState extends State<FixedAttendanceReportView> {

  TeacherAttendanceController attendanceController = Get.find();

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
              label: Text('Roll',style: widget.textStyle == null ? mainName : widget.textStyle),
              onSort: onSort,
            ),
            DataColumn(
              label: Text('Name',style: widget.textStyle == null ? mainName : widget.textStyle),
            ),
          ],
          rows: [
            ...attendanceController.teacherAttendanceList
                .map((attendance) =>
                DataRow(
                  cells: [

                    DataCell(
                        Text(
                          '${attendance.rollNo.toString()}',
                          style:  TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: widget.textColor == null ? pink : widget.textColor,
                            fontFamily: 'Roboto',
                          ),
                        )),

                    DataCell(
                        Text(
                          '${attendance.firstName} ${attendance.lastName}',
                          style:  TextStyle(
                            fontSize: 12,
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
        attendanceController.teacherAttendanceList.sort((user1, user2) =>
            compareString(ascending, user1.fullName, user2.fullName));
      }
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }
  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

}
