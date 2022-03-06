import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/student/routine/routine_list_get.dart';

import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/logout_popup.dart';

class Routine extends StatelessWidget {
  const Routine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black87,),
            ),
            title: Text('Routine',style: TextStyle(fontFamily: 'OpenSans', color: Colors.black87),),
            centerTitle: true,
            backgroundColor: orangeOne,
            shadowColor: Colors.transparent,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 3.0, top: 2.0),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => BuildPopupDialog(),
                    );
                  },
                  icon: Icon(Icons.logout,
                      color: Colors.black87, size: 25.0),
                ),
              ),
            ],
            bottom: TabBar(
              labelColor: Colors.black87,
              tabs: [
                Tab(text: 'Sun'),
                Tab(text: 'Mon'),
                Tab(text: 'Tue'),
                Tab(text: 'Wed'),
                Tab(text: 'Thu'),
                Tab(text: 'Fri'),
              ],
            ),
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
