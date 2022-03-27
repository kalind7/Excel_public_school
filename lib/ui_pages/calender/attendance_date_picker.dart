import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_attendance_controller.dart';

// ignore: must_be_immutable
class AttendanceDatePicker extends StatefulWidget {
  AttendanceDatePicker(
      {Key? key, this.icon, this.mainAxisAlignment, this.textStyle})
      : super(key: key);

  Widget? icon;

  TextStyle? textStyle;

  MainAxisAlignment? mainAxisAlignment = MainAxisAlignment.start;

  @override
  _AttendanceDatePickerState createState() => _AttendanceDatePickerState();
}

class _AttendanceDatePickerState extends State<AttendanceDatePicker> {
  DateTime _dateTime = DateTime.now();

  String format = DateFormat('yyyy-MM-dd').format(DateTime.now());

  TeacherAttendanceController attendanceController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment == null
            ? MainAxisAlignment.start
            : widget.mainAxisAlignment!,
        children: <Widget>[
          Text('$format',
              style:
                  widget.textStyle == null ? dropDownTitle : widget.textStyle),

          IconButton(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                helpText: 'Select Date',
                context: context,
                // ignore: unnecessary_null_comparison
                initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                firstDate: DateTime(2001),
                lastDate: DateTime(2025),
              );
              if (attendanceController.studentClassList.isNotEmpty &&
                  attendanceController.studentSectionList.isNotEmpty &&
                  picked != null &&
                  picked != _dateTime) {
                setState(() {

                  _dateTime = picked;
                  String onlyDate = DateFormat('yyyy-MM-d').format(picked);
                  format = '$onlyDate';
                });
                var newData = {
                  "class": attendanceController.selectedClass,
                  "section": attendanceController.selectedSection,
                  "attendance_date": _dateTime.toString() ,
                };
                print(newData);
                attendanceController.getTeacherAttendanceList(newData);
              }
            },
            icon: widget.icon == null
                ? Icon(
                    Icons.calendar_today,
                    color: pink,
                  )
                : widget.icon!,
          ),
        ],
      ),
    );
  }
}
