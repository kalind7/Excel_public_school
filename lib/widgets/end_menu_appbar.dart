import 'package:excel_public_school/ui_pages/dashboard.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThreeDotMenu extends StatelessWidget {
  const ThreeDotMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: SvgPicture.asset('files/icons/menu.svg'),
      color: Colors.white,
      itemBuilder: (context) => [
        const PopupMenuItem<int>(
          value: 0,
          child: Text('Setting', style: drawerTitle,),
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
    );
  }
}
