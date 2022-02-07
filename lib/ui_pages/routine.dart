import 'package:flutter/material.dart';
import 'package:new_project_work/widgets/logout_popup.dart';
import 'package:new_project_work/widgets/routine_list_get.dart';

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
              icon: Icon(Icons.arrow_back),
            ),
            title: Text('Routine'),
            centerTitle: true,
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
                  icon: Icon(Icons.power_settings_new,
                      color: Colors.white, size: 25.0),
                ),
              ),
            ],
            bottom: TabBar(
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

          body: TabBarView(
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
    );


  }
}

