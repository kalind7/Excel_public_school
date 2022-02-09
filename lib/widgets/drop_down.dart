import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:searchfield/searchfield.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _userVal;
  // List _userList = ['Name', 'Class', 'Roll Number', 'E-mail', 'Phone Number'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: HexColor("#F4F4F4")),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.08),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(4, 3), // changes position of shadow
            ),
          ]),
      child: SearchField(
        hint: 'Search',
        searchInputDecoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue.shade200,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        itemHeight: 50.0,
        maxSuggestionsInViewPort: 5,
        suggestionsDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        suggestions: ['Name', 'Class', 'Roll Number', 'E-mail', 'Phone Number'],
        onTap: (value){
          _userVal = value;
        },
      ),
    );
  }
}

//Container(
//       margin: EdgeInsets.only(left: 10, right: 10),
//       padding: EdgeInsets.only( left: 20, right: 20.0, bottom: 10.0),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: HexColor("#F4F4F4"), width: 2.0),
//           borderRadius: BorderRadius.circular(10.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(.08),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(4, 3), // changes position of shadow
//             ),
//           ]),
//       child:
//DropdownButtonFormField(
//         decoration: InputDecoration(
//           prefixIcon: IconButton(
//             onPressed: (){},
//             icon: Icon(Icons.search, size: 24, color: Colors.black87),
//           ),
//         ),
//         hint: Text('Search your requirements'),
//         style: TextStyle(
//             color: Colors.black87,
//             fontSize: 16.0,
//             fontWeight: FontWeight.normal,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'MontserratAlternates'
//         ),
//         dropdownColor: Colors.grey[50],
//         elevation: 5,
//         icon: Icon(Icons.arrow_drop_down),
//         iconSize: 30.0,
//         isExpanded: true,
//         value: _userVal,
//         onChanged: (value) {
//           setState(() {
//             _userVal = value;
//           });
//         },
//         items: _userList.map((value){
//           return DropdownMenuItem(
//             value: value,
//               child: Text(value)
//           );
//         }).toList(),
//       ),
