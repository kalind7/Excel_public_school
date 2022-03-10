import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/controller/teacher_attendance_controller.dart';

class FixedColumnNameWidget extends StatefulWidget {
   FixedColumnNameWidget({Key? key, this.color, this.textColor}) : super(key: key);

  Color ? color;
  Color ? textColor;

  @override
  _FixedColumnNameWidgetState createState() => _FixedColumnNameWidgetState();
}

class _FixedColumnNameWidgetState extends State<FixedColumnNameWidget> {

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
              label: Text('Name',style: mainName,),
              onSort: onSort,
            ),
          ],
          rows: [
            ...attendanceController.teacherAttendanceList
                .map((attendance) =>
                DataRow(
                  cells: [
                    DataCell(
                        Text(
                          '${attendance.id.toString()}   ${attendance.fullName}',
                          style:  TextStyle(
                            fontSize: 14,
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
