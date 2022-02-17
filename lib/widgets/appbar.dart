import 'package:excel_public_school/utils/color.dart';
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
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
      ),
      leading: IconButton(
        onPressed: () {
          onPress();
        },
        icon: Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black87, fontFamily: 'OpenSans'),
      ),
      centerTitle: true,
      backgroundColor: orangeOne,
      shadowColor: Colors.transparent,
      actions: [

        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon:SvgPicture.asset('files/icons/search.svg'),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('files/icons/menu.svg'),
            ),
          ],
        ),
      ],
    );
  }
}