import 'package:flutter/material.dart';
import 'package:new_project_work/utils/fonts.dart';

import '../../utils/color.dart';

class DurationDropdown extends StatefulWidget {
  DurationDropdown({Key? key,this.color ,required this.value,required this.iconSize ,required this.expanded })  : super(key: key);

  double  value;
  double iconSize;
  bool  expanded ;
  Color? color;

  @override
  _DurationDropdownState createState() => _DurationDropdownState();
}

class _DurationDropdownState extends State<DurationDropdown> {

  final List<String> duration = [
    "Select Duration","Weekly Homework", "Monthly Homework", "Yearly Homework",
  ];

  String selectedDuration = "Select Duration";


  @override
  Widget build(BuildContext context) {
    Size width = MediaQuery.of(context).size;

    return  Container(
      width: width.width * widget.value ,
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
        value: selectedDuration,
        onChanged: (value){
          setState(() {
            selectedDuration = value!;
          });
        },
        items: duration.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem(
            child: Text(value,style: dropDownTitle ,),
            value: value,
          );
        }).toList(),
      ),
    );

  }
}