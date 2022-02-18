import 'dart:ffi';

import 'package:excel_public_school/ui_pages/calendar.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';




class TabBarMaterialWidget extends StatefulWidget {
   const TabBarMaterialWidget({Key? key, required this.index, required this.onChangedTab}) : super(key: key);

  final int index;
  final ValueChanged<int> onChangedTab;
  @override
  _TabBarMaterialWidgetState createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {



  @override
  Widget build(BuildContext context) {

    final placeHolder = Opacity(
        opacity: 0,
      child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)),

    );

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      color: HexColor('#E1E5EC'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            buildTabItem(index: 0, icon: 'files/bottom_navbar_icons/profile.png'),
            buildTabItem(index: 1, icon: 'files/bottom_navbar_icons/calendar.png'),
            placeHolder,
            buildTabItem(index: 2, icon: 'files/bottom_navbar_icons/homework.png'),
            buildTabItem(index: 3, icon: 'files/bottom_navbar_icons/notice.png'),

          ],
        ),

    );
  }
  
  Widget buildTabItem({
  required int index,
    required String icon
}){

    final isSelected = index == widget.index;

    return IconTheme(
        data: IconThemeData(
          color: isSelected ? pinkOne : Colors.black,
        ),
        child: IconButton(
      color: pinkOne,
      onPressed: () => widget.onChangedTab(index),
      icon: Image.asset(icon),
    ));
  }
  
}


