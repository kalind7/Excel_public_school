import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/teacher_widgets/practical_scrollablle_table.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/controller/teacher_attendance_controller.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/views/fixed_column_view.dart';

class PracticalResultTable extends StatefulWidget {
  const PracticalResultTable({Key? key}) : super(key: key);

  @override
  _PracticalResultTableState createState() => _PracticalResultTableState();
}

class _PracticalResultTableState extends State<PracticalResultTable> {

  TeacherAttendanceController attendanceController = Get.find();

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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(title: 'View Overall Result', onPress: (){}, width: 105),
                    button(title: 'Submit', onPress: (){}, width: 105),
                    button(title: 'View Section Result', onPress: (){}, width: 105),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    FixedColumnNameWidget(color: Colors.grey.shade300,textColor: Colors.blueGrey.shade300,),
                    ScrollablePracticalExamView(),
                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button ({
  required String title,
    required Function onPress,
    required double width,
      }){
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: pink,
            onPrimary: Colors.white,
            onSurface: Colors.grey,
            shadowColor: orangeOne,
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.all(5)),
        onPressed: () {},
        child: Text(
          title,
          style: buttonTitle,
        ),
      ),
    );
  }

}

