import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/practical_exam/after_search_done.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/exam_info_gridpages/practical_exam/transfer_page.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/drop_down/class_drop_down.dart';
import 'package:new_project_work/widgets/drop_down/exam_type_drop_down.dart';
import 'package:new_project_work/widgets/drop_down/section_drop_down.dart';
import 'package:new_project_work/widgets/drop_down/subject_drop_down.dart';
import 'package:new_project_work/widgets/drop_down/year_drop_down.dart';

class ExamPractical extends StatelessWidget {
  const ExamPractical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppbar(
          icon: Icons.arrow_back,
            title: 'Add Exam Practical',
            onPress: (){
            Get.back();
            },
        ),
      ),
      body: BodyWithWidgetContainer(
          upperWidget: Container(
            margin: EdgeInsets.fromLTRB(5, 20, 5, 0),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Center(child: Text('Add New Practical',style: TextStyle(fontSize: 18.0,color: pink,fontFamily: 'Roboto',),),),
          ),
          bodyWidget: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
             child: Column(
               children: [
                 Container(
                   margin: EdgeInsets.fromLTRB(10,30,10,0),
                   height: MediaQuery.of(context).size.height * 0.56,
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(7.5),
                     color: Colors.white,
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
                     children: [
                       YearDropDown(value: 0.8, iconSize: 35 , expanded: true),
                       Padding(padding: EdgeInsets.symmetric(horizontal: 7.0),child: Divider(thickness: 1,height: 1,color: pink,),),
                       ClassDropDown(value: 0.8, iconSize: 35, expanded: true),
                       Padding(padding: EdgeInsets.symmetric(horizontal: 7.0),child: Divider(thickness: 1,height: 1,color: pink,),),
                       SectionDropDown(value: 0.8,iconSize: 35, expanded: true ),
                       Padding(padding: EdgeInsets.symmetric(horizontal: 7.0),child: Divider(thickness: 1,height: 1,color: pink,),),
                       SubjectDropDown(value: 0.8, expanded: true, iconSize: 35),
                       Padding(padding: EdgeInsets.symmetric(horizontal: 7.0),child: Divider(thickness: 1,height: 1,color: pink,),),
                       ExamDropDown(value: 0.8, expanded: true, iconSize: 35),
                       Padding(padding: EdgeInsets.symmetric(horizontal: 7.0),child: Divider(thickness: 1,height: 1,color: pink,),),
                       SizedBox(
                         width: 150,
                         child: ElevatedButton(
                           style: ElevatedButton.styleFrom(
                               primary: pink,
                               elevation: 5,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10)),
                               padding: EdgeInsets.all(5)),
                           onPressed: () {
                             Get.to(SecondExamPractical());
                           },
                           child: Hero(
                             transitionOnUserGestures: true,
                             tag: 'newTag',
                             child: Text(
                               'Search Subject',
                               style: TextStyle(
                                   fontSize: 16,
                                   color: Colors.white,
                                   fontFamily: 'Roboto',
                                   fontWeight: FontWeight.w600),
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),

                 SizedBox(height: 5.0,),

                 SizedBox(
                   width: 150,
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                         primary: pink,
                         elevation: 5,
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10)),
                         padding: EdgeInsets.all(5)),
                     onPressed: () {
                       Get.to(TransferPage());
                     },
                     child: Hero(
                       transitionOnUserGestures: true,
                       tag: 'secondTag',
                       child: Text(
                         'Transfer',
                         style: TextStyle(
                             fontSize: 16,
                             color: Colors.white,
                             fontFamily: 'Roboto',
                             fontWeight: FontWeight.w600),
                       ),
                     ),
                   ),
                 ),


               ],
             ),

          ),
      ),
    );
  }
}
