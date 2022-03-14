import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/controller/teacher_attendance_controller.dart';

class SectionDropDown extends StatefulWidget {
   SectionDropDown({Key? key,this.color , this.value, required this.expanded, required this.iconSize }) : super(key: key);


  double ? value;
  bool expanded ;
  double iconSize;
  Color? color;

  @override
  _SectionDropDownState createState() => _SectionDropDownState();
}

class _SectionDropDownState extends State<SectionDropDown> {


  TeacherAttendanceController attendanceController = Get.find();

  // final List<String> sections = [
  //   "Select Section",'Section A', 'Section B', 'Section C','Section D'
  // ];



  @override
  Widget build(BuildContext context) {
    // Size width = MediaQuery.of(context).size;

    return  Obx(() => Container(
      // width: width.width * widget.value,
      padding: EdgeInsets.only(left: 2.0),
      margin: EdgeInsets.all( 5.0),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        border: Border.all(width: 0.5,color: widget.color == null ? Colors.transparent : widget.color!),
      ),

      child: DropdownButton<String>(
        isExpanded: widget.expanded,
        iconSize: widget.iconSize,
        iconDisabledColor: pink,
        iconEnabledColor: pink,
        focusColor: Colors.white,
        dropdownColor: Colors.white,
        underline: SizedBox(),
        hint: Text('Select Section'),
        value: attendanceController.selectedSection,
        onChanged: (value){
          setState(() {
            attendanceController.selectedSection = value! ;
          });
        },
        items: attendanceController.studentSectionList.map<DropdownMenuItem <String>>((value) {
          return DropdownMenuItem(
            child: Text(value['section_name'].toString(),style: dropDownTitle,),
            value: value['id'].toString(),
          );
        }).toList(),
      ),
    ),);

  }
}