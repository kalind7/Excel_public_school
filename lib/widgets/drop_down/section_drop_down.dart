import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';

// class SectionDropDown extends StatefulWidget {
//   const SectionDropDown({Key? key}) : super(key: key);
//
//   @override
//   _SectionDropDownState createState() => _SectionDropDownState();
// }
//
// class _SectionDropDownState extends State<SectionDropDown> {
//   final items = [
//     'Section : A',
//     'Section : A',
//     'Section : A',
//     'Section : A',
//     'Section : A',
//   ];
//    String ? value;
//
//   @override
//   Widget build(BuildContext context) =>
//      Scaffold(
//        body: Container(
//          width: 100,
//          padding: EdgeInsets.only(left: 2.0),
//          margin: EdgeInsets.only( top: 5.0, bottom: 5.0, left: 5, right: 3.0),
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(10.0),
//            color: Colors.white,
//            border: Border.all(width: 0.5,color: Colors.grey.shade300),
//          ),
//          child: DropdownButton<String>(
//            isExpanded: true,
//              items: items.map((buildMenuItem)).toList(),
//            onChanged: (value){
//                setState(() {
//                  this.value = value ;
//                });
//            },
//          ),
//        ),
//      );
//
//   DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
//     value: item,
//       child: Text(item,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'Roboto'),),
//   );
//
// }



class SectionDropDown extends StatefulWidget {
  const SectionDropDown({Key? key}) : super(key: key);

  @override
  _SectionDropDownState createState() => _SectionDropDownState();
}

class _SectionDropDownState extends State<SectionDropDown> {


  final List<String> sections = [
    'Select Section','Section A', 'Section B', 'Section C'
  ];

  String selectedSection = 'Select Section';

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