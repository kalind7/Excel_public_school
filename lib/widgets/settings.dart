import 'package:flutter/material.dart';
import 'package:new_project_work/widgets/build_menu_item.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Settings'),
      ),
        drawer :Drawer(
          child: Container(
            color: Color.fromRGBO(50, 75, 205, 1),
            child: ListView(
              children:<Widget> [
                buildMenuItem(
                  text: 'Data',
                  icon: Icons.people,
                  onpress: (){},
                ),
              ],
            ),
          ),
        ),
    );
  }
}


