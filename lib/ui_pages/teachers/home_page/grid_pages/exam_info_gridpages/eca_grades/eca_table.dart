import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/teacher_widgets/button.dart';

import '../../../../../../utils/color.dart';

class ECATable extends StatelessWidget {
  const ECATable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: WidgetAppbar(
            icon: Icons.arrow_back,
            title: 'Add Exam Practical',
            onPress: () {
              Get.back();
            },
          ),
        ),
        body: BodyWithWidgetContainer(
            upperWidget: Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Center(
                child: Text('Add New Practical', style: examPageHeadTitle),
              ),
            ),
            bodyWidget: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Fill Marks',style: TextStyle(fontSize: 22,fontFamily: 'Roboto',fontWeight: FontWeight.w700,color: pink),),
                  Text('Leave blank if absent',style: TextStyle(fontSize: 18,fontFamily: 'Roboto',fontWeight: FontWeight.w500,color: pink),),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 3),
                    child: Divider(
                      thickness: 1,
                      height: 1,
                      color: pink,
                    ),
                  ),
                  rowData(roll: 'Roll No.', name: 'Student Name', handwriting: 'Handwriting'),
                  rowData(roll: '1', name: 'Shreesti Magar', handwriting: '70.5'),
                  rowData(roll: '2', name: 'Shreesti Magar', handwriting: '70.5'),
                  rowData(roll: '3', name: 'Shreesti Magar', handwriting: '70.5'),
                  rowData(roll: '4', name: 'Shreesti Magar', handwriting: '70.5'),
                  rowData(roll: '5', name: 'Shreesti Magar', handwriting: '70.5'),
                  rowData(roll: '6', name: 'Shreesti Magar', handwriting: '70.5'),
                  rowData(roll: '7', name: 'Shreesti Magar', handwriting: '70.5'),
                  rowData(roll: '8', name: 'Shreesti Magar', handwriting: '70.5'),
                  rowData(roll: '9', name: 'Shreesti Magar', handwriting: '70.5'),
                  rowData(roll: '10', name: 'Shreesti Magar', handwriting: '70.5'),

                  SizedBox(height: 15,),

                  button(title: 'Save', onPress: () => Get.snackbar(
                    'Access Denied',
                    'You\'re not the class teacher\n for this class',
                    duration:  Duration(seconds: 2),
                    snackPosition: SnackPosition.TOP,
                    colorText: Colors.white,
                    borderRadius: 10.0,
                    backgroundColor: HexColor('#C45954'),
                    boxShadows: [
                      BoxShadow(
                        color: HexColor('#C45954'),
                        spreadRadius: 2,
                        blurRadius: 4,
                        blurStyle: BlurStyle.inner,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    icon: Icon(Icons.warning,size: 30,color: Colors.white,),
                  ), width: 120),
                ],
              ),
            )));
  }

  Widget rowData({
    required String roll,
    required String name,
    required String handwriting,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              roll,
              style: ecaRowTitle,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              name,
              style: ecaRowTitle,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              handwriting,
              style: ecaRowTitle,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 3),
          child: Divider(
            thickness: 1,
            height: 1,
            color: pink,
          ),
        ),
      ],
    );
  }
}
