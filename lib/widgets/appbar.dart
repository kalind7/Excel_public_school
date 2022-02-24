import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/settings.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/logout_popup.dart';

class WidgetAppbar extends StatelessWidget {
  WidgetAppbar(
      {Key? key,
      required this.title,
      required this.onPress,
      this.icon,
      this.color})
      : super(key: key);

  final String title;
  final Function onPress;
  IconData? icon;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: icon != null
          ? IconButton(
              onPressed: () {onPress();},
              icon: Icon(
                icon,
                color: Colors.white,
              ),
            )
          : SizedBox(),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
      ),
      centerTitle: true,
      backgroundColor: color == null ? Colors.transparent : color,
      shadowColor: Colors.transparent,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 3.0, top: 2.0),
          child: PopupMenuButton<int>(
            icon: Icon(Icons.more_vert),
            color: Colors.white,
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Setting', style: headerStyle),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text(
                  'Privacy Policy Page',
                  style: headerStyle,
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: const [
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Logout",
                      style: headerStyle,
                    ),
                  ],
                ),
              ),
            ],
            onSelected: (item) => SelectedItem(context, item),
          ),
        ),
      ],
    );
  }
}

void SelectedItem(BuildContext context, item) {
  switch (item) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Settings()));
      break;
    case 1:
      if (kDebugMode) {
        print("Privacy Clicked");
      }
      break;
    case 2:
      if (kDebugMode) {
        print("User Logged out");
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const BuildPopupDialog();
          });
  }
}
