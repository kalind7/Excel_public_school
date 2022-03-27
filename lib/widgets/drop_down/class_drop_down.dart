import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_attendance_controller.dart';
import 'package:new_project_work/ui_pages/teachers/models/student_attendance_list_model.dart';

import '../../utils/color.dart';

class ClassDropDown extends StatefulWidget {
   ClassDropDown({Key? key,this.color , this.value,required this.iconSize ,required this.expanded })  : super(key: key);

   double ?  value;
   double iconSize;
   bool  expanded ;
   Color? color;

  @override
  _ClassDropDownState createState() => _ClassDropDownState();
}

class _ClassDropDownState extends State<ClassDropDown> {

  TeacherAttendanceController attendanceController = Get.find();

  // final List<String> classes = [
  //   "Select Class","Class 1", "Class 2", "Class 3", "Class 4","Class 5",
  // ];

  // ignore: invalid_use_of_protected_member


  @override
  Widget build(BuildContext context) {
    // Size width = MediaQuery.of(context).size;

    return  Obx(() => Container(
      // width: width.width * widget.value ,
      padding: EdgeInsets.only(left: 2.0),
      // margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.5,color: widget.color == null ? Colors.transparent : widget.color!),
      ),
      child: DropdownButton<String>(
        isExpanded: widget.expanded,
        iconDisabledColor: pink,
        iconEnabledColor: pink,
        iconSize: widget.iconSize,
        focusColor: Colors.white,
        dropdownColor: Colors.white,
        underline: SizedBox(),
        value: attendanceController.selectedClass  ,
        hint: Text('Select Class', style: dropDownTitle,),
        onChanged: (value){
          attendanceController.getSection(value);
          setState(() {
            attendanceController.selectedClass  = value!;
          });
        },
        items: attendanceController.studentClassList.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem(
            child: Text(value['class_name'],style: dropDownTitle ,),
            value: value['id'].toString(),
          );
        }).toList(),
      ),
    ),);

  }
}