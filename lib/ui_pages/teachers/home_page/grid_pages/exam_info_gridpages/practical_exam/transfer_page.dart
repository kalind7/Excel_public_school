import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/drop_down/class_drop_down.dart';
import 'package:new_project_work/widgets/drop_down/exam_type_drop_down.dart';
import 'package:new_project_work/widgets/drop_down/section_drop_down.dart';
import 'package:new_project_work/widgets/drop_down/subject_drop_down.dart';
import 'package:new_project_work/widgets/teacher_widgets/button.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        child: WidgetAppbar(
          title: 'Add Exam Practical',
          icon: Icons.arrow_back,
          onPress: () => Get.back(),
        ),
        preferredSize: Size.fromHeight(55.0),
      ),
      body: BodyWithWidgetContainer(
        top: 100,
        upperWidget: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  'Practical Marks',
                  style: examPageHeadTitle,
                ),
              ),
            ),
            SizedBox(
              height: 13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  VerticalDivider(
                    width: 3.5,
                    thickness: 3.5,
                    color: pink,
                  ),

                  VerticalDivider(
                    width: 3.5,
                    thickness: 3.5,
                    color: pink,
                  ),
                ],
              ),
            ),
          ],
        ),
        bodyWidget: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Hero(
                tag: 'secondTag',
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      margin: EdgeInsets.fromLTRB(7,0,7,3),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: orangeOne,
                            spreadRadius: 2,
                            blurRadius: 4,
                            blurStyle: BlurStyle.inner,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('From Subject :',style: transferTitle,),
                              SizedBox(width: 10,),
                              SubjectDropDown(value: 0.34, expanded: false, iconSize: 40,color: pink,),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Class :',style: transferTitle,),

                              ClassDropDown(value: 0.31, expanded: false, iconSize: 40,color: pink,),
                              SizedBox(width: 2.0,),
                              Text('Sec :',style: transferTitle,),
                              Flexible(fit: FlexFit.tight,child: SectionDropDown(value: 0.32, expanded: false, iconSize: 40,color: pink,),)
                            ],
                          ),
                          Row(
                            children: [
                              Text('To Subject :',style: transferTitle,),
                              SizedBox(width: 20,),
                              SubjectDropDown(value: 0.34, expanded: false, iconSize: 40,color: pink,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 120,
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
                          'Transfer',
                          style: buttonTitle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(7, 20, 7, 0),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: orangeOne,
                      spreadRadius: 1,
                      blurRadius: 4,
                      blurStyle: BlurStyle.inner,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Transfer Terminal Practical',
                    style: examPageHeadTitle
                  ),
                ),
              ),
              SizedBox(
                height: 13.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    VerticalDivider(
                      width: 3.5,
                      thickness: 3.5,
                      color: pink,
                    ),

                    VerticalDivider(
                      width: 3.5,
                      thickness: 3.5,
                      color: pink,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                margin: EdgeInsets.fromLTRB(7,0,7,3),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: orangeOne,
                      spreadRadius: 2,
                      blurRadius: 4,
                      blurStyle: BlurStyle.inner,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('Terminal :',style: transferTitle,),
                        SizedBox(width: 40,),
                        SubjectDropDown(value: 0.34, expanded: false, iconSize: 40,color: pink,),

                      ],
                    ),
                    Row(
                      children: [
                        Text('Exam Type :',style: transferTitle,),
                        SizedBox(width: 20,),
                        ExamDropDown(value: 0.4, expanded: false, iconSize: 40,color: pink,),
                      ],
                    ),
                  ],
                ),
              ),

              button(title: 'Transfer', onPress: (){}, width: 120),

            ],
          ),
        ),
      ),
    );
  }
}
