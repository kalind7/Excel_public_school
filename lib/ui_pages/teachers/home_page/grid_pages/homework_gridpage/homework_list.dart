import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/calender/attendance_date_picker.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/drop_down/class_drop_down.dart';
import 'package:new_project_work/widgets/drop_down/duration_dropdown.dart';
import 'package:new_project_work/widgets/drop_down/section_drop_down.dart';
import 'package:new_project_work/widgets/teacher_widgets/button.dart';
import 'package:new_project_work/widgets/teacher_widgets/container_with_dropdown.dart';

class HomeworkList extends StatelessWidget {
  HomeworkList({Key? key, required this.title, required this.title2, required this.onPress, this.buttonTitle}) : super(key: key);

  final String title;
  final String title2;
   String ? buttonTitle;
  final Function  onPress ;

  TextStyle textStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: pink,
      fontFamily: 'Roboto');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppbar(
            icon: Icons.arrow_back,
            title: title,
            onPress: () {
              Get.back();
            }),
      ),
      body: BodyWithWidgetContainer(
          top: 100,
          upperWidget: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                title2,
                style: examPageHeadTitle,
              ),
            ),
          ),
          bodyWidget: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        newContainer(
                          title: 'Class',
                          widget: ClassDropDown(
                              value: 0.08, iconSize: 25, expanded: false),
                          height: MediaQuery.of(context).size,
                          width: MediaQuery.of(context).size * 0.35,
                        ),
                        newContainer(
                          title: 'Section',
                          widget: SectionDropDown(
                              value: 0.08, iconSize: 25, expanded: false),
                          height: MediaQuery.of(context).size,
                          width: MediaQuery.of(context).size * 0.35,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    newContainer(
                      title: 'Subject',
                      widget: ClassDropDown(
                          value: 0.8, iconSize: 25, expanded: true),
                      height: MediaQuery.of(context).size,
                      width: MediaQuery.of(context).size,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    newContainer(
                      title: 'Duration',
                      widget: DurationDropdown(
                          value: 0.8, iconSize: 25, expanded: true),
                      height: MediaQuery.of(context).size,
                      width: MediaQuery.of(context).size,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    newContainer(
                      title: 'Submission Date',
                      widget: Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: AttendanceDatePicker(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textStyle: textStyle,
                        ),
                      ),
                      height: MediaQuery.of(context).size,
                      width: MediaQuery.of(context).size,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    button(
                        title: buttonTitle == null ? 'Search Homework' : buttonTitle!,
                        width: 150,
                        onPress: () => onPress(),),
                  ]),
            ),
          )),
    );
  }
}
