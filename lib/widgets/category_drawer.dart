import 'package:excel_public_school/ui_pages/admin_bio.dart';
import 'package:excel_public_school/ui_pages/dashboard.dart';
import 'package:excel_public_school/ui_pages/settings.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:excel_public_school/models/build_menu_item.dart';
import 'package:excel_public_school/widgets/logout_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoryDrawer extends StatefulWidget {
  const CategoryDrawer({Key? key}) : super(key: key);

  @override
  State<CategoryDrawer> createState() => _CategoryDrawerState();
}

class _CategoryDrawerState extends State<CategoryDrawer> {
  @override
  Widget build(BuildContext context) {

    List<BuildMenuItem> items = [
      BuildMenuItem(
        text: 'Student Profile',
        iconTitle: 'files/drawer_icons/std.png',
        onPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  AdminBio()));
        },
      ),
      BuildMenuItem(
        text: 'Fees',
        iconTitle: 'files/drawer_icons/fees.png',
        onPress: () {

        },
      ),
      BuildMenuItem(
        text: 'Results',
        iconTitle: 'files/drawer_icons/exam.png',
        onPress: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Fees()));
        },
      ),
      BuildMenuItem(
        text: 'Attendance',
        iconTitle: 'files/drawer_icons/attendance.png',
        onPress: () {
          // Get.toNamed('/login');
        },
      ),
      BuildMenuItem(
        text: 'Subjects',
        iconTitle: 'files/drawer_icons/subjects.png',
        onPress: () {
          // Get.toNamed('/login');
        },
      ),
      BuildMenuItem(
        text: 'Downloads',
        iconTitle: 'files/drawer_icons/downloads.png',
        onPress: () {
          // Get.toNamed('/login');
        },
      ),
      BuildMenuItem(
        text: 'Routine',
        iconTitle: 'files/drawer_icons/routine.png',
        onPress: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Routine()));
        },
      ),
      BuildMenuItem(
        text: 'Library',
        iconTitle: 'files/drawer_icons/library.png',
        onPress: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Library()));
        },
      ),
      BuildMenuItem(
        text: 'Teachers',
        iconTitle: 'files/drawer_icons/teacher.png',
        onPress: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherLists()));
        },
      ),
      BuildMenuItem(
        text: 'Exam',
        iconTitle: 'files/drawer_icons/onlineClass.png',
        onPress: () {
          // Get.toNamed('/login');
        },
      ),
      BuildMenuItem(
        text: 'Dormitory',
        iconTitle: 'files/drawer_icons/dorm.png',
        onPress: () {
          Get.toNamed('/login');
        },
      ),
      BuildMenuItem(
        text: 'Transport',
        iconTitle: 'files/drawer_icons/bus.png',
        onPress: () {
          Get.toNamed('/login');
        },
      ),
      BuildMenuItem(
        text: 'Logout',
        iconTitle: 'files/drawer_icons/logout2.png',
        onPress: () {
          showDialog(
            context: context,
            builder: (BuildContext context) =>
            const BuildPopupDialog(),
          );
        },
      ),
      BuildMenuItem(
        text: 'Settings',
        iconTitle: 'files/drawer_icons/settings.png',
        onPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Settings()));
        },
      ),
    ];

    return Drawer(
      elevation: 3.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [orangeOne, orangeOne, pinkOne],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child:
            ListView.builder(
              itemCount:items.length ,
                itemBuilder: (context, index){
                return Column(
                  children: [
                    ListTile(
                      leading: IconButton(
                        onPressed: (){},
                        iconSize: 16,
                        icon: Image.asset(items[index].iconTitle),
                      ),
                      title: Text(items[index].text,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,fontFamily: 'Roboto',color: Colors.white)),

                      onTap: () {
                       items[index].onPress();
                      },

                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child:   Divider(
                        height: 1.0,
                        thickness: 1.0,
                        color: Colors.white,
                      ),
                    ),

                  ],
                );
                }
            ),
          ),

        ],
      ),
    );
  }
}
