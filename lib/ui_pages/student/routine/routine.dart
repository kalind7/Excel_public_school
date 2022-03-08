import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/routine/routine_list_get.dart';

import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/logout_popup.dart';

class Routine extends StatelessWidget {
  const Routine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: PreferredSize(
            child: WidgetAppbar(
                title: 'Routine',
                color: pink,
                icon: Icons.arrow_back,
                onPress: (){
            Get.back();
          }),
              preferredSize: Size.fromHeight(55.0),
          ),

          body: SafeArea(
            child: TabBarView(
              children: [
                RoutineGetList(),
                RoutineGetList(),
                RoutineGetList(),
                RoutineGetList(),
                RoutineGetList(),
                RoutineGetList(),
              ],
            ),
          ),
        ),
    );


  }
}

