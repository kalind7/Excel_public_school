import 'package:excel_public_school/ui_pages/dashboard.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:excel_public_school/widgets/logout_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class WidgetAppbar extends StatelessWidget {
  const WidgetAppbar(
      {Key? key,
        required this.title,
        required this.onPress,
        required this.icon})
      : super(key: key);

  final String title;
  final Function onPress;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          onPress();
        },
        icon: SvgPicture.asset(icon),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 3.0, top: 2.0),
          child:  PopupMenuButton<int>(
            icon: SvgPicture.asset('files/icons/menu.svg'),
            color: Colors.white,
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Settings', style: drawerTitle,),
              ),

              const PopupMenuItem<int>(
                value: 1,
                child: Text('Privacy Policy Page', style: drawerTitle,),
              ),

              const PopupMenuDivider(),

              PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children:const [
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text("Logout", style: drawerTitle,),
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