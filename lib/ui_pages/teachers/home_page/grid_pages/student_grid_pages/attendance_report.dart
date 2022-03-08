import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/calender/date_picker.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/drop_down/section_drop_down.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/views/fixed_column_view.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/views/scrollable_attendancereport.dart';

import '../../../../../widgets/drop_down/class_drop_down.dart';

class AttendanceReport extends StatelessWidget {
  const AttendanceReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          child: WidgetAppbar(
            icon: Icons.arrow_back,
            onPress: (){
              Navigator.pop(context);
            },
            title: 'Attendance Report',
          ),
          preferredSize: Size.fromHeight(55.0),
      ),
      body: BodyWithWidgetContainer(

        upperWidget: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
              height: MediaQuery.of(context).size.height * 0.090,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClassDropDown(),
                  SectionDropDown(),
                  Flexible(child: AttendanceDatePicker(),)
                ],
              ),
            ),
          ],
        ),
          bodyWidget: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            margin: EdgeInsets.only(bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('Class -',style: reportHeader,),
                    SizedBox(width: 5,),
                    Text('Section',style: reportHeader,),
                  ],),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Month,',style: reportHeader,),
                      SizedBox(width: 3,),
                      Text('Year',style: reportHeader,),
                    ],
                  ),

                  SizedBox(height: 7,),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Present: P',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Roboto',color: Colors.green.shade300),),
                      Text('Absent: A',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Roboto',color: Colors.red.shade300),),
                      Text('Late: L',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Roboto',color: pink),),
                      Text('Holiday: H',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Roboto',color: Colors.orange.shade300),),
                    ],
                  ),

                  SizedBox(height: 7,),

                  Row(
                    children: [
                      FixedColumnNameWidget(),

                      ScrollableAttendanceReport(),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
