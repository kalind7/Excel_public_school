
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/models/gird_view_list.dart';
// import 'package:new_project_work/ui_pages/dashboard.dart';
// import 'package:new_project_work/ui_pages/dashboard.dart';

class GridController extends GetxController{

  var girdList = <Model>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDetails();
  }

  fetchDetails()async{

    await Future.delayed(Duration(seconds: 1))  ;

    var newList2 = [
        Model(
          text: 'Profile',
          icon: Icons.person,
          onpress:() {
            // Get.toNamed('/dashboard') ;
          } ,
        ),
      Model(
          text: 'Fees',
          icon: Icons.event_note_rounded,
          onpress: () {
            print('pressed');
            // Get.toNamed('/dashboard') ;
          }),
      Model(
          text: 'Result',
          icon: Icons.file_copy_sharp,
          onpress: () {
            print('not pressed');
            // Get.toNamed('/login') ;
          }),
      Model(
          text: 'Attendance',
          icon: Icons.home_work_outlined,
          onpress: () {
            print('pressed');
          }),
      Model(
          text: 'Subjects',
          icon: Icons.subject,
          onpress: () {
            print('pressed');
          }),
      Model(
          text: 'Downloads',
          icon: Icons.download_rounded,
          onpress: () {
            print('pressed');
          }),
      Model(
          text: 'Routine',
          icon: Icons.request_page_outlined,
          onpress: () {
            print('pressed');
          }),
      Model(
          text: 'Library',
          icon: Icons.library_books_sharp,
          onpress: () {
            print('pressed');
          }),
      Model(
          text: 'Teachers',
          icon: Icons.people,
          onpress: () {
            print('pressed');
          }),
      Model(
          text: 'Exam',
          icon: Icons.wallpaper,
          onpress: () {
            print('pressed');
          }),
      Model(
          text: 'Dormitory',
          icon: Icons.hotel,
          onpress: () {
            print('pressed');
          }),
      Model(
          text: 'Transport',
          icon: Icons.bus_alert,
          onpress: () {
            print('pressed');
          }),
    ];

     girdList.value = newList2 ;
  }

}