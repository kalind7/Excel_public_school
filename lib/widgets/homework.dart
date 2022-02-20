import 'package:excel_public_school/models/student_model.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:excel_public_school/widgets/appbar.dart';
import 'package:excel_public_school/widgets/category_drawer.dart';
import 'package:excel_public_school/widgets/grid_view.dart';
import 'package:excel_public_school/widgets/homework_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hexcolor/hexcolor.dart';



class Homework extends StatelessWidget {
   Homework({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          key: _scaffoldKey ,
          drawer: CategoryDrawer(),
          body: ListView(
            children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18)),
                      gradient: LinearGradient(
                          colors: [pinkOne, orangeOne],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: Stack(
                      children: [
                        WidgetAppbar(
                          title: 'Homework',
                          icon: 'files/icons/four_bar_menu.svg',
                          onPress: () => _scaffoldKey.currentState!.openDrawer(),
                        ),

                       SizedBox(height: 20,),

                       Positioned(
                         top: 70,
                           left: 20,
                           right: 20,
                           child: Row(
                             children: [
                               SizedBox(width: 10.0,),

                               Checkbox(value: true, onChanged:(value){} ),
                               Text('From',style: dateTitle,),

                               SizedBox(width: 100.0,),

                               Checkbox(value: false, onChanged:(value){} ),
                               Text('To',style: dateTitle,),
                             ],
                           ),
                       ),
                      ],
                    ),
                  ),

              HomeworkContainer(context),

              HomeworkContainer(context),

              HomeworkContainer(context),

            ],
          ),

        ),
    );
  }
}
