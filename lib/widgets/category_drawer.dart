

import 'package:excel_public_school/ui_pages/settings.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:excel_public_school/widgets/build_drawer_items.dart';
import 'package:excel_public_school/widgets/drawer_footer.dart';
import 'package:excel_public_school/widgets/logout_popup.dart';
import 'package:flutter/cupertino.dart';
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
      child: ListView(
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
            child: ListView(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        child: Image(
                          height: 75,
                          width: 75,
                          image: AssetImage('files/images/excellogo.png'),
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.only( top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ram Bahadur Aryal',style: TextStyle(fontSize: 18.0,wordSpacing: 4 ,fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: Colors.white),),

                            SizedBox(
                              height: 8.0,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Class: UKG', style: TextStyle(fontSize: 14, fontFamily: 'Roboto', color: Colors.white, fontWeight: FontWeight.w600),),

                                SizedBox(
                                  height: 15,
                                  width: 30,
                                  child:  VerticalDivider(

                                    thickness: 1,
                                    color: Colors.white,
                                  ),
                                ),

                                Text('Sec: A', style: TextStyle(fontSize: 14, fontFamily: 'Roboto', color: Colors.white, fontWeight: FontWeight.w600),),
                              ],
                            ),

                            SizedBox(
                              height: 8.0,
                            ),

                            Text('Roll No : 01', style: TextStyle(fontSize: 14, fontFamily: 'Roboto', color: Colors.white, fontWeight: FontWeight.w600),),

                          ],
                        ),

                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 12, right: 5, left: 5),
                  child: Divider(
                    height: 2,
                    thickness: 3,
                    color: Colors.white,
                  ),
                ),

                BuildDrawerItem(
                  text: 'Student Profile',
                  iconTitle: 'files/drawer_icons/std.png',
                  onPress: () {
                    Get.toNamed('/student');
                  },
                ),
                BuildDrawerItem(
                  text: 'Fees',
                  iconTitle: 'files/drawer_icons/fees.png',
                  onPress: () {

                  },
                ),
                BuildDrawerItem(
                  text: 'Results',
                  iconTitle: 'files/drawer_icons/exam.png',
                  onPress: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Fees()));
                  },
                ),
                BuildDrawerItem(
                  text: 'Attendance',
                  iconTitle: 'files/drawer_icons/attendance.png',
                  onPress: () {
                    // Get.toNamed('/login');
                  },
                ),
                BuildDrawerItem(
                  text: 'Subjects',
                  iconTitle: 'files/drawer_icons/subjects.png',
                  onPress: () {
                    // Get.toNamed('/login');
                  },
                ),
                BuildDrawerItem(
                  text: 'Downloads',
                  iconTitle: 'files/drawer_icons/downloads.png',
                  onPress: () {
                    // Get.toNamed('/login');
                  },
                ),
                BuildDrawerItem(
                  text: 'Routine',
                  iconTitle: 'files/drawer_icons/routine.png',
                  onPress: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Routine()));
                  },
                ),
                BuildDrawerItem(
                  text: 'Library',
                  iconTitle: 'files/drawer_icons/library.png',
                  onPress: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Library()));
                  },
                ),
                BuildDrawerItem(
                  text: 'Teachers',
                  iconTitle: 'files/drawer_icons/teacher.png',
                  onPress: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherLists()));
                  },
                ),
                BuildDrawerItem(
                  text: 'Exam',
                  iconTitle: 'files/drawer_icons/onlineClass.png',
                  onPress: () {
                    // Get.toNamed('/login');
                  },
                ),
                BuildDrawerItem(
                  text: 'Dormitory',
                  iconTitle: 'files/drawer_icons/dorm.png',
                  onPress: () {
                    Get.toNamed('/login');
                  },
                ),
                BuildDrawerItem(
                  text: 'Transport',
                  iconTitle: 'files/drawer_icons/bus.png',
                  onPress: () {
                    Get.toNamed('/login');
                  },
                ),
                BuildDrawerItem(
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
                BuildDrawerItem(
                  text: 'Settings',
                  iconTitle: 'files/drawer_icons/settings.png',
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Settings()));
                  },
                ),

                DrawerFooter(),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
//ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.vertical,
//                       physics: ClampingScrollPhysics(),
//                       padding: const EdgeInsets.only(bottom: 20.0),
//                       itemCount:items.length ,
//                       itemBuilder: (context, index){
//                         return Column(
//                           children: [
//                             ListTile(
//                               leading: IconButton(
//                                 onPressed: (){items[index].onPress();},
//                                 iconSize: 16,
//                                 icon: Image.asset(items[index].iconTitle),
//                               ),
//                               title: Text(items[index].text,
//                                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,fontFamily: 'Roboto',color: Colors.white)),
// 
//                               onTap: () {
//                                 items[index].onPress();
//                               },
// 
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 8.0),
//                               child:   Divider(
//                                 height: 1.0,
//                                 thickness: 1.0,
//                                 color: Colors.white,
//                               ),
//                             ),
// 
//                           ],
//                         );
//                       }
//                   ),