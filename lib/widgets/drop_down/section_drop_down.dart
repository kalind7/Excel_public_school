import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';

class SectionDropDown extends StatefulWidget {
   SectionDropDown({Key? key,this.color ,required this.value, required this.expanded, required this.iconSize }) : super(key: key);


  double  value;
  bool expanded ;
  double iconSize;
  Color? color;

  @override
  _SectionDropDownState createState() => _SectionDropDownState();
}

class _SectionDropDownState extends State<SectionDropDown> {


  final List<String> sections = [
    "Select Section",'Section A', 'Section B', 'Section C','Section D'
  ];

  String selectedSection = 'Select Section';

  @override
  Widget build(BuildContext context) {
    Size width = MediaQuery.of(context).size;

    return  Container(
      width: width.width * widget.value,
      padding: EdgeInsets.only(left: 2.0),
      margin: EdgeInsets.only( top: 5.0, bottom: 5.0, left: 5, right: 5.0),
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
        value: selectedSection,
        onChanged: (value){
          setState(() {
            selectedSection = value!;
          });
        },
        items: sections.map<DropdownMenuItem <String>>((value) {
          return DropdownMenuItem(
              child: Text(value,style: dropDownTitle,),
                  value: value,
          );
        }).toList(),
      ),
    );

  }
}