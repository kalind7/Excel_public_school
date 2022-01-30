import 'package:flutter/material.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        drawer :Drawer(
          child: Container(
            color: Color.fromRGBO(50, 75, 205, 1),
            child: ListView(
              children:<Widget> [
                buildMenuItem(
                  text: 'Data',
                  icon: Icons.people,
                ),
              ],
            ),
          ),
        ),
    );
  }
}

Widget buildMenuItem({
required  String text,
  required IconData icon,
}) {
  final color = Colors.white;
  final hoverColor = Colors.white70 ;
  return ListTile(

  leading: Icon(icon, color: color),
  title: Text(text, style: TextStyle(color: color)),
  hoverColor: hoverColor,
  onTap: (){},
  );

}
