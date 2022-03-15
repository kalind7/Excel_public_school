import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';

class ExamRemarks extends StatelessWidget {
   ExamRemarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
          child: WidgetAppbar(
            icon: Icons.arrow_back,
              title: 'Exam Remarks',
              onPress: (){
              Get.back();
              },
          ),
      ),
      body: BodyWithWidgetContainer(
        top: 100,
        upperWidget: Container(
          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Center(child: Text('Remarks List',style: examPageHeadTitle),),
        ),
        bodyWidget: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.0,vertical: 5),
                child: Divider(
                  thickness: 1,
                  height: 1,
                  color: pink,
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 15,),
                  Text('S.N',style: ecaRowTitle,), SizedBox(width: 15,),
                  Text('Code',style: ecaRowTitle,), SizedBox(width: 20,),
                  Text('Remarks',style: ecaRowTitle,),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.0,vertical: 5),
                child: Divider(
                  thickness: 1,
                  height: 1,
                  color: pink,
                ),
              ),
              // rowData(serialNum: 'S.N', code: 'Code', remarks: 'Remarks'),
              rowData(serialNum: '1', code: '1', remarks: 'A good result, Keep it up.'),
              rowData(serialNum: '2', code: '2', remarks: 'A very good improvement.\nHe/She has worked hard ,Keep it up'),
              rowData(serialNum: '3', code: '3', remarks: 'A fair result, should aim for a \nhigher goal.'),
              rowData(serialNum: '4', code: '4', remarks: 'Need an all out effort in all subjects .'),
              rowData(serialNum: '5', code: '5', remarks: 'He/She has to work very hard from\nnow,if he/she hopes to go next class'),
              rowData(serialNum: '6', code: '6', remarks: 'His/Her attendance must be improved\nupon for a better performance.'),
              rowData(serialNum: '7', code: '7', remarks: 'A poor result but one that can be \nbettered if his/her attendance is\nimproved upon.'),
              rowData(serialNum: '8', code: '8', remarks: 'A very hard worker but still very weak,\nhe/she is too weak in English.'),
              rowData(serialNum: '9', code: '9', remarks: 'Congratulations! You are Promoted to\nUpper Class.(RESULT : PASSED)'),
              // rowData(serialNum: '10', code: '10', remarks: 'Hard work is the only way out.\nHe/she needs to start immediately.'),
            ],
          ),
        )
      ),
    );
  }
Widget rowData({
  required String serialNum,
  required String code,
  required String remarks,
}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 20.0,),
          Text(
            serialNum,
            style: textStyle,
          ),
          SizedBox(
            width: 30.0,
          ),
          Text(
            code,
            style: textStyle,
          ),
          SizedBox(
            width: 40.0,
          ),
          Text(
            remarks,
            style: textStyle,
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5),
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
