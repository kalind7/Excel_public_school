import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/calender/attendance_date_picker.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/drop_down/class_drop_down.dart';
import 'package:new_project_work/widgets/drop_down/section_drop_down.dart';
import 'package:new_project_work/widgets/drop_down/subject_drop_down.dart';
import 'package:new_project_work/widgets/teacher_widgets/button.dart';
import 'package:new_project_work/widgets/teacher_widgets/container_with_dropdown.dart';

class AddHomework extends StatelessWidget {
   AddHomework({Key? key,required this.title,this.mainTitle,this.buttonTitle ,required this.onPress }) : super(key: key);

  final String title;
  String ? mainTitle;
  String ? buttonTitle;
  final Function onPress;

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: pink,fontFamily: 'Roboto');

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppbar(
            icon: Icons.arrow_back,
            title: mainTitle == null ? 'Homework' : mainTitle!,
            onPress: () {
              Get.back();
            }
        ),
      ),
      body: BodyWithWidgetContainer(
        top: 100,
        upperWidget: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Center(child: Text(title,style: examPageHeadTitle,),),
        ),
          bodyWidget: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child:Column(
              children: [
                newContainer(
                  title: 'Class',
                  widget: ClassDropDown(value: 0.8, iconSize: 35, expanded: true),
                  height: MediaQuery.of(context).size,
                  width: MediaQuery.of(context).size,
                ),
                newContainer(
                  title: 'Section',
                  widget: SectionDropDown(value: 0.8, iconSize: 35, expanded: true),
                  height: MediaQuery.of(context).size,
                  width: MediaQuery.of(context).size,
                ),
                newContainer(
                  title: 'Subject',
                  widget: SubjectDropDown(value: 0.8, iconSize: 35, expanded: true),
                  height: MediaQuery.of(context).size,
                  width: MediaQuery.of(context).size,
                ),
                newContainer(
                  title: 'Homework Date',
                  widget:  Padding(padding: EdgeInsets.only(left: 7),child: AttendanceDatePicker(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textStyle: textStyle,
                  ),),
                  height: MediaQuery.of(context).size,
                  width: MediaQuery.of(context).size,
                ),
                newContainer(
                  title: 'Submission Date',
                  widget: Padding(padding: EdgeInsets.only(left: 7),child: AttendanceDatePicker(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textStyle: textStyle,
                  ),),
                  height: MediaQuery.of(context).size,
                  width: MediaQuery.of(context).size,
                ),
                newContainer(
                  title: 'Marks',
                  widget:  Padding(padding: EdgeInsets.only(left: 7, bottom: 5),child:TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your marks',
                      hintStyle: textStyle,
                    ),
                  ),),

                  height: MediaQuery.of(context).size,
                  width: MediaQuery.of(context).size,
                ),
                newContainer(
                  title: 'Attach File',
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Padding(padding: EdgeInsets.only(top: 6,left: 7),child: Text('Browse Files',style: textStyle),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.upload,color: pink,size: 25,)),
                    ],
                  ),
                  height: MediaQuery.of(context).size,
                  width: MediaQuery.of(context).size,
                ),

                SizedBox(height: 7,),
                button(title: buttonTitle == null ? 'Save Homework' : buttonTitle! , onPress: () => onPress(), width: 130),
              ],
            ),
          ),
      ),
    );
  }
}


