import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';

class SingleDropDownName extends StatefulWidget {
  const SingleDropDownName({Key? key}) : super(key: key);

  @override
  _SingleDropDownNameState createState() => _SingleDropDownNameState();
}

class _SingleDropDownNameState extends State<SingleDropDownName> {


  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: EdgeInsets.only( top: 10.0, bottom: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              // border: Border.all(
              //   color: orangeOne,
              //   width: 1.0,
              // ),
            ),
            child: DropdownButton(
              focusColor: Colors.white,
              dropdownColor: Colors.white,
              underline: SizedBox(),
              style: TextStyle(fontSize: 16.0, color: Colors.black87, fontFamily: 'OpenSans'),
              value: _value,
              items: [
                DropdownMenuItem(
                  child: Text('Select Name'),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text('Name 1'),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text('Name 2'),
                  value: 3,
                ),
                DropdownMenuItem(
                  child: Text('Name 3'),
                  value: 4,
                ),
                DropdownMenuItem(
                  child: Text('Name 4'),
                  value: 5,
                ),
              ],
              onChanged: (int? value){
                setState(() {
                  _value = value!;
                });
              },
              hint: Text("Select Name"),
            ),
          );

  }
}