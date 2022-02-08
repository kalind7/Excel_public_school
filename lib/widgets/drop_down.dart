
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
   var _userVal;
  List _userList = [
    'Name', 'Class', 'Roll Number', 'E-mail', 'Phone Number'
  ];
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration:  BoxDecoration(
          color: Colors.white,
          border: Border.all(color: HexColor("#F4F4F4"), width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.08),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(4, 3), // changes position of shadow
            ),
          ]),
      child: DropdownButton(
        hint: Text('Search your requirements'),
        style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic,
            fontFamily: 'MontserratAlternates'
        ),
        dropdownColor: Colors.grey,
        elevation: 5,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 20.0,
        isExpanded: true,

        value: _userVal,
        onChanged: (value){
          setState(() {
            _userVal = value;
          });
        },
        items: _userList.map((value){
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
