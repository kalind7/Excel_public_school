import 'package:flutter/material.dart';
import 'package:new_project_work/utils/fonts.dart';

import '../../utils/color.dart';

class ClassDropDown extends StatefulWidget {
  const ClassDropDown({Key? key}) : super(key: key);

  @override
  _ClassDropDownState createState() => _ClassDropDownState();
}

class _ClassDropDownState extends State<ClassDropDown> {


  final List<String> classes = [
    "Select Class","Class 1", "Class 2", "Class 3", "Class 4", "Class 5", "Class 6", "Class 7", "Class 8", "Class 9", "Class 10"
  ];

  String selectedClass = "Select Class";

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: 2.0),
      margin: EdgeInsets.only( top: 5.0, bottom: 5.0, left: 5, right: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        border: Border.all(width: 0.5,color: pink),
      ),
      child: DropdownButton<String>(
        iconDisabledColor: pink,
        iconEnabledColor: pink,
        focusColor: Colors.white,
        dropdownColor: Colors.white,
        underline: SizedBox(),
        style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'Roboto'),
        value: selectedClass,
        onChanged: (value){
          setState(() {
            selectedClass = value!;
          });
        },
        items: classes.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem(
              child: Text(value,style: dropDownTitle,),
            value: value,
          );
        }).toList(),
      ),
    );

  }
}