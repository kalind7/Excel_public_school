import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:new_project_work/ui_pages/calender/calender.dart';
import 'package:new_project_work/ui_pages/student/homework/views/student_homework_landing.dart';
import 'package:new_project_work/ui_pages/student/notice/notice.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/teacher_home_page.dart';
import 'package:new_project_work/utils/color.dart';

import '../profile/teacher_profile.dart';

class TeacherLandingPage extends StatefulWidget {
  @override
  State<TeacherLandingPage> createState() => _TeacherLandingPageState();
}

class _TeacherLandingPageState extends State<TeacherLandingPage> {
  var _pageController;
  final screens = <Widget>[
    TeacherProfile(),
    // StudentAttendanceView(),
    Calendar(),
    TeacherHomePage(),
    StudentHomeworkLanding(),
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
                        icon: SvgPicture.asset('assets/nav_bar_icons/profile.svg'), label: 'Profile'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/nav_bar_icons/calendar.svg'), label: 'Calender'),
                    BottomNavigationBarItem(
                        icon:Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(
                        icon:SvgPicture.asset('assets/nav_bar_icons/homework.svg'), label: 'Homework'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/nav_bar_icons/notice2.svg'), label: 'Notice')
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
  }
}
