import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/fees.dart';
import 'package:new_project_work/ui_pages/settings.dart';
import 'package:new_project_work/widgets/admin_bio.dart';
import 'package:new_project_work/widgets/build_menu_item.dart';
import 'package:new_project_work/widgets/logout_popup.dart';

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
      child:  Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              accountName: Text('Kalind Koirala',style: TextStyle(fontSize: 16.0, fontFamily: 'OpenSans',color: Colors.black),),
              accountEmail: Text('kalindkoirala7@gmail.com',style: TextStyle(fontSize: 16.0, fontFamily: 'OpenSans',color: Colors.black),),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/profile.png'),
              ),
            ),

            buildMenuItem(
              text: 'Profile',
              icon: Icons.person,
              onpress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminBio(
                          text: 'Kalind Koirala',
                          bio: 'My name is Kalind and I am a freelance mobile app developer\n If you need any mobile app for your company then contact me for more informations. ',
                          jobtitle: 'Job',
                          answer1: 'Developer',
                          length: 'Time',
                          answer2: '1+ Year',
                          question: 'Teacher ?',
                          answer3: 'YES',
                        )));
              },
            ),
            buildMenuItem(
              text: 'Fees',
              icon: Icons.event_note_rounded,
              onpress: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Fees()));
              },
            ),
            buildMenuItem(
              text: 'Result',
              icon: Icons.file_copy_sharp,
              onpress: () {
                Get.toNamed('/login');
              },
            ),
            buildMenuItem(
              text: 'Attendance',
              icon: Icons.home_work_outlined,
              onpress: () {
                Get.toNamed('/attendance');
              },
            ),
            buildMenuItem(
              text: 'Subjects',
              icon: Icons.subject,
              onpress: () {
                Get.toNamed('/login');
              },
            ),
            buildMenuItem(
              text: 'Downloads',
              icon: Icons.download_rounded,
              onpress: () {
                Get.toNamed('/login');
              },
            ),
            buildMenuItem(
              text: 'Routine',
              icon: Icons.request_page_outlined,
              onpress: () {
                Get.toNamed('/login');
              },
            ),
            buildMenuItem(
              text: 'Library',
              icon: Icons.library_books_sharp,
              onpress: () {
                Get.toNamed('/login');
              },
            ),
            buildMenuItem(
              text: 'Teachers',
              icon: Icons.people,
              onpress: () {
                Get.toNamed('/login');
              },
            ),
            buildMenuItem(
              text: 'Exam',
              icon: Icons.wallpaper,
              onpress: () {
                Get.toNamed('/login');
              },
            ),
            buildMenuItem(
              text: 'Dormitory',
              icon: Icons.hotel,
              onpress: () {
                Get.toNamed('/login');
              },
            ),
            buildMenuItem(
              text: 'Transport',
              icon: Icons.bus_alert,
              onpress: () {
                Get.toNamed('/login');
              },
            ),
            Divider(
              color: Colors.black87,
              thickness: 1,
            ),
            buildMenuItem(
              text: 'Logout',
              icon: Icons.logout,
              onpress: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      BuildPopupDialog(),
                );
              },
            ),

            buildMenuItem(
              text: 'Settings',
              icon: Icons.settings,
              onpress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
          ],
        ),
      ),

    );
  }
}
