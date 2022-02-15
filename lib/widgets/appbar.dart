import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/logout_popup.dart';

class WidgetAppbar extends StatelessWidget {
  WidgetAppbar(
      {Key? key,
      required this.title,
      required this.onPress,
      required this.icon})
      : super(key: key);

  final String title;
  final Function onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
          onPressed: () {
            onPress();
          },
          icon: Icon(
            icon,
            color: Colors.black87,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.black87, fontFamily: 'OpenSans'),
        ),
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
              icon: Icon(Icons.logout, color: Colors.black87, size: 25.0),
            ),
          ),
        ],
      );
  }
}
