import 'package:flutter/material.dart';

class SingleDropDownClass extends StatefulWidget {
  const SingleDropDownClass({Key? key}) : super(key: key);

  @override
  _SingleDropDownClassState createState() => _SingleDropDownClassState();
}

class _SingleDropDownClassState extends State<SingleDropDownClass> {


  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only( top: 10.0, bottom: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: DropdownButton(
        focusColor: Colors.white,
        dropdownColor: Colors.white,
        style: TextStyle(fontSize: 16.0, color: Colors.black87, fontFamily: 'MontserratAlternates'),
        value: _value,
        items: [
          DropdownMenuItem(
            child: Text('Select Class'),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text('Class 1'),
            value: 2,
          ),
          DropdownMenuItem(
            child: Text('Class 2'),
            value: 3,
          ),
          DropdownMenuItem(
            child: Text('Class 3'),
            value: 4,
          ),
          DropdownMenuItem(
            child: Text('Class 4'),
            value: 5,
          ),
        ],
        onChanged: (int? value){
          setState(() {
            _value = value!;
          });
        },
      ),
    );

  }
}