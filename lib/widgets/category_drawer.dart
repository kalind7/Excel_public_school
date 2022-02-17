import 'package:excel_public_school/ui_pages/admin_bio.dart';
import 'package:excel_public_school/ui_pages/dashboard.dart';
import 'package:excel_public_school/ui_pages/settings.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:excel_public_school/widgets/build_menu_item.dart';
import 'package:excel_public_school/widgets/logout_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDrawer extends StatefulWidget {
  const CategoryDrawer({Key? key}) : super(key: key);

  @override
  State<CategoryDrawer> createState() => _CategoryDrawerState();
}

class _CategoryDrawerState extends State<CategoryDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3.0,
      child:Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ orangeOne, orangeOne, pinkOne],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child:  ListView(
            children: <Widget>[
              buildMenuItem(
                text: 'Student Profile',
                iconTitle: 'files/icons/download.jpg',
                onPress: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const Dashboard()));
                },
              ),

              buildMenuItem(
                text: 'Fees',
                iconTitle: 'files/icons/fees.jpg',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminBio(
                            text: 'Kalind Koirala',
                            bio: 'My name is Kalind and I am a freelance mobile app developer\n If you need any mobile app for your company then contact me for more informations. ',
                            jobTitle: 'Job',
                            answer1: 'Developer',
                            length: 'Time',
                            answer2: '1+ Year',
                            question: 'Teacher ?',
                            answer3: 'YES',
                          )));
                },
              ),
              buildMenuItem(
                text: 'Results',
                iconTitle: 'files/icons/results.jpg',
                onPress: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Fees()));
                },
              ),
              buildMenuItem(
                text: 'Attendance',
                iconTitle: 'files/icons/attendance.jpg',
                onPress: () {
                  // Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Subjects',
                iconTitle: 'files/icons/subjects.jpg',
                onPress: () {
                  // Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Downloads',
                iconTitle: 'files/icons/download.jpg',
                onPress: () {
                  // Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Routine',
                iconTitle: 'files/icons/routine.jpg',
                onPress: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Routine()));
                },
              ),
              buildMenuItem(
                text: 'Library',
                iconTitle:'files/icons/library.jpg',
                onPress: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Library()));
                },
              ),
              buildMenuItem(
                text: 'Teachers',
                iconTitle: 'files/icons/teacher.jpg',
                onPress: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherLists()));
                },
              ),
              buildMenuItem(
                text: 'Exam',
                iconTitle: 'files/icons/results.jpg',
                onPress: () {
                  // Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Dormitory',
                iconTitle: 'files/icons/dorm.jpg',
                onPress: () {
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Transport',
                iconTitle: 'files/icons/bus.jpg',
                onPress: () {
                  Get.toNamed('/login');
                },
              ),

              buildMenuItem(
                text: 'Logout',
                iconTitle: 'files/icons/fees.jpg',
                onPress: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                    const BuildPopupDialog(),
                  );
                },
              ),

              buildMenuItem(
                text: 'Settings',
                iconTitle: 'files/icons/fees.jpg',
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
                },
              ),
            ],
          ),
        ),


      ),

    );
  }
}