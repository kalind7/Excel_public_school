import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/teacher_widgets/button.dart';
import 'package:new_project_work/widgets/teacher_widgets/classwise_practical_table.dart';
import 'package:new_project_work/widgets/teacher_widgets/practical_scrollablle_table.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/controller/teacher_attendance_controller.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/views/fixed_column_view.dart';

class ClasswiseTable extends StatefulWidget {
  const ClasswiseTable({Key? key}) : super(key: key);

  @override
  _ClasswiseTableState createState() => _ClasswiseTableState();
}

class _ClasswiseTableState extends State<ClasswiseTable> {

  TeacherAttendanceController attendanceController = Get.put(TeacherAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppbar(
            icon: Icons.arrow_back,
            title: 'Add Practical Exam',
            onPress: () {
              Get.back();
            }
        ),
      ),
      body: BodyWithWidgetContainer(
        upperWidget: Container(
          margin: EdgeInsets.fromLTRB(5, 30, 5, 0),
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Center(child: Text('Class Overall Result',style: examPageHeadTitle),),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Column(
                  children: [
                    Text('First Terminal',style: examPageHeadTitle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Class : 1',style: TextStyle(
                          fontSize: 15,color: pink,fontFamily: 'Roboto',fontWeight: FontWeight.w500
                        ),),
                        SizedBox(
                          height: 12.5,
                          child: VerticalDivider(
                            width: 2,
                            thickness: 2,
                            color: pink,
                          ),
                        ),
                        SizedBox(width: 2,),
                        Text('Section : A',style: TextStyle(
                            fontSize: 15,color: pink,fontFamily: 'Roboto',fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                ],),

                Divider(
                  height: 2,
                  thickness: 2,
                  color: pink,
                ),

                SizedBox(height: 10.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(title: 'View Overall Result', onPress: (){}, width: 120),

                    button(title: 'View Section Result', onPress: (){}, width: 120),
                  ],
                ),

                SizedBox(height: 10),

                Divider(
                  height: 2,
                  thickness: 2,
                  color: pink,
                ),

                SizedBox(height: 10),
                Row(
                  children: [
                    FixedColumnNameWidget(color: Colors.grey.shade300,textColor: Colors.blueGrey.shade300,textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                      fontFamily: 'Roboto',
                    ),),
                    ClasswiseScrollablePracticalTable(),
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

