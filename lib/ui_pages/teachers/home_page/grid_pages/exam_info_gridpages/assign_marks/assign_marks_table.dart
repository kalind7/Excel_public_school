import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';

class AssignMarksTable extends StatelessWidget {
  const AssignMarksTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppbar(
          icon: Icons.arrow_back,
          title: 'Assign Marks',
          onPress: () {
            Get.back();
          },
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
            child: Center(
              child: Text('Add New Practical', style: examPageHeadTitle),
            ),
          ),
          bodyWidget: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.only(top: 5.0),
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                height: MediaQuery.of(context).size.height * 0.77,
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

                     rowData(rollNum: 'Roll', name: 'Student Names', theory: 'Theory/75', practical: 'Prac/25', total: 'Total'),
                     rowData(rollNum: '1.)', name: 'Shreesti Magar', theory: '70.5', practical: '25', total: '95.5'),
                     rowData(rollNum: '2.)', name: 'Shreesti Magar', theory: '70.5', practical: '25', total: '95.5'),
                     rowData(rollNum: '3.)', name: 'Shreesti Magar', theory: '70.5', practical: '25', total: '95.5'),
                     rowData(rollNum: '4.)', name: 'Shreesti Magar', theory: '70.5', practical: '25', total: '95.5'),
                     rowData(rollNum: '5.)', name: 'Shreesti Magar', theory: '70.5', practical: '25', total: '95.5'),
                     rowData(rollNum: '6.)', name: 'Shreesti Magar', theory: '70.5', practical: '25', total: '95.5'),
                     rowData(rollNum: '7.)', name: 'Shreesti Magar', theory: '70.5', practical: '25', total: '95.5'),
                     rowData(rollNum: '8.)', name: 'Shreesti Magar', theory: '70.5', practical: '25', total: '95.5'),
                     rowData(rollNum: '9.)', name: 'Shreesti Magar', theory: '70.5', practical: '25', total: '95.5'),
                     rowData(rollNum: '10.)',name: 'Shreesti Magar', theory: '70.5', practical: '25',total: '95.5'),

                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: pink,
                            elevation: 5,
                            shadowColor: orangeOne,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(5)),
                        onPressed: () {
                          // Get.to(TransferPage());
                        },
                        child:Text(
                          'Save',
                          style: buttonTitle,
                        ),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }

  Widget rowData({
    required String rollNum,
    required String name,
    required String theory,
    required String practical,
    required String total,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              rollNum,
              style: marksRowTitle,
            ),
            SizedBox(width: 10,),
            Text(
              name,
              style: marksRowTitle,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              theory,
              style: marksRowTitle,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              practical,
              style: marksRowTitle,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              total,
              style: marksRowTitle,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 7),
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
