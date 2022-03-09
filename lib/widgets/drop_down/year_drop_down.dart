import 'package:flutter/material.dart';
import 'package:new_project_work/utils/fonts.dart';

import '../../utils/color.dart';

class YearDropDown extends StatefulWidget {
   YearDropDown({Key? key, required this.value,required this.iconSize ,required this.expanded}) : super(key: key);


  double  value;
  double iconSize;
  bool expanded ;

  @override
  _YearDropDownState createState() => _YearDropDownState();
}

class _YearDropDownState extends State<YearDropDown> {


  final List<String> years = [
    "Select Year","2074", "2075", "2076", "2077", "2078",
  ];

  String selectedYear = "Select Year";


  @override
  Widget build(BuildContext context) {
    Size width = MediaQuery.of(context).size;

    return  Container(

      width: width.width * widget.value,
      padding: EdgeInsets.only(left: 2.0),
      margin: EdgeInsets.only( top: 5.0, bottom: 5.0, left: 5, right: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        // border: Border.all(width: 0.5,color: pink),
      ),
      child: DropdownButton<String>(
        isExpanded: widget.expanded,
        iconSize: widget.iconSize,
        iconDisabledColor: pink,
        iconEnabledColor: pink,
        focusColor: Colors.white,
        dropdownColor: Colors.white,
        underline: SizedBox(),
        value: selectedYear,
        onChanged: (value){
          setState(() {
            selectedYear = value!;
          });
        },
        items: years.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem(
            child: Text(value,style: dropDownTitle,),
            value: value,
          );
        }).toList(),
      ),
    );

  }
}