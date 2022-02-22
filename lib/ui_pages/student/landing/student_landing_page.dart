import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/calender/calender.dart';
import 'package:new_project_work/ui_pages/student/homepage/student_home_page.dart';
import 'package:new_project_work/ui_pages/student/homework/student_homework.dart';
import 'package:new_project_work/ui_pages/student/notice/notice.dart';
import 'package:new_project_work/ui_pages/student/profile/student_profile.dart';
import 'package:new_project_work/utils/color.dart';

// ignore: non_constant_identifier_names
// void SelectedItem(BuildContext context, item) {
//   switch (item) {
//     case 0:
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => const Settings()));
//       break;
//     case 1:
//       if (kDebugMode) {
//         print("Privacy Clicked");
//       }
//       break;
//     case 2:
//       if (kDebugMode) {
//         print("User Logged out");
//       }
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return const BuildPopupDialog();
//           });
//   }
// }

class StudentLandingPage extends StatefulWidget {
  @override
  State<StudentLandingPage> createState() => _StudentLandingPageState();
}

class _StudentLandingPageState extends State<StudentLandingPage> {
  var _pageController;
  final screens = <Widget>[
    StudentDetails(),
    Calendar(),
    StudentHomePage(),
    StudentHomework(),
    Notice(),
  ];

  int _currentIndex = 2;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Get.defaultDialog(
              title: '',
              content: const Text('Do you want to exit the App?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () => exit(0),
                  child: const Text('Yes'),
                )
              ],
            ) ??
            false;
      },
      child: Scaffold(
        // appBar: AppBar(title: Text('BottomNavigationBar')),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: screens,
        ),

        // screens[_currentIndex],
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 2,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: kBottomNavigationBarHeight + 10,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  // iconSize: 20.0,
                  showUnselectedLabels: true,
                  unselectedLabelStyle: TextStyle(color: black),
                  currentIndex: _currentIndex,
                  backgroundColor: greyish,
                  selectedItemColor: pink,
                  unselectedItemColor: black,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                      _pageController.jumpToPage(index);
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: 'Profile'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.calendar_today), label: 'Calender'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                          color: Colors.transparent,
                        ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.book), label: 'Homework'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.event), label: 'Notice')
                  ]),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: _currentIndex == 2 ? pink : greyish,
            child: Icon(Icons.home, color: _currentIndex == 2 ? white : black),
            onPressed: () => setState(() {
              _pageController.jumpToPage(2);
              _currentIndex = 2;
            }),
          ),
        ),
      ),
    );
    // return Scaffold(
    //   extendBody: true,
    //   floatingActionButton: _showNotch? FloatingActionButton(
    //
    //     splashColor: pinkOne,
    //     backgroundColor: HexColor('#E1E5EC'),
    //     onPressed: (){
    //       Navigator.push(context, MaterialPageRoute(builder: (context) => NewDashboard() ));
    //     },
    //     tooltip: 'Home',
    //     child: ImageIcon(const AssetImage('files/bottom_navbar_icons/home.png'),color: pinkOne,size: 40,),
    //   ): null,
    //   floatingActionButtonLocation: _fabLocation,
    //   // bottomNavigationBar: TabBarMaterialWidget(
    //   //   index : index,
    //   //   onChangedTab: onChangedTab,
    //   // ),
    //   body: screens[index],
    //
    //   bottomNavigationBar: TabBarMaterialWidget(
    //     index : index,
    //     onChangedTab: onChangedTab,
    //   ),
    // );
    //
  }
}
