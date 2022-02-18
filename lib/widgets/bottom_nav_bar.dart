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

    const placeHolder =  Opacity(
        opacity: 0,
      child: IconButton(onPressed: null, icon:  Icon(Icons.no_cell)),

    );

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      color: HexColor('#E1E5EC'),
        child: SizedBox(
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildTabItem(index: 0, icon: 'files/bottom_navbar_icons/profile.png'),

                    Text('Profile', style: TextStyle(color: widget.index == 0 ? Colors.black: pinkOne),)

                  ],
                ),


                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildTabItem(index: 1, icon: 'files/bottom_navbar_icons/calendar.png'),

                    Text('Calendar', style: TextStyle(color: widget.index == 1 ? Colors.black: pinkOne),)

                  ],
                ),

                placeHolder,


                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildTabItem(index: 2, icon: 'files/bottom_navbar_icons/homework.png'),

                    Text('Homework', style: TextStyle(color: widget.index == 2 ? Colors.black: pinkOne),)

                  ],
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildTabItem(index: 3, icon: 'files/bottom_navbar_icons/notice.png'),

                    Text('Notice', style: TextStyle(color: widget.index == 3 ? Colors.black: pinkOne),)

                  ],
                ),


              ],
            ),
          ),

    );
  }
  
  Widget buildTabItem({
  required int index,
    required String icon
}){
    return  IconButton(
      onPressed: () => widget.onChangedTab(index),
      icon: Image.asset(icon, color: pinkOne),
    );
  }
  
}


