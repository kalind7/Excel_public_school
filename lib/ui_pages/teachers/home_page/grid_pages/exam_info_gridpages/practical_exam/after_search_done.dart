import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';

class SecondExamPractical extends StatelessWidget {
  const SecondExamPractical({Key? key}) : super(key: key);

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
          margin: EdgeInsets.fromLTRB(5, 30, 5, 0),
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              'Add New Practical',
              style: examPageHeadTitle
            ),
          ),
        ),
        bodyWidget: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.only(top: 5.0),
            margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
            height: MediaQuery.of(context).size.height * 0.59,
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
            child: Hero(
              tag: 'newTag',
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  rowData(
                      serialNum: 'S.N',
                      title: 'Title',
                      marks: 'Marks',
                      action: Text(
                        'Action',
                        style: examRowTitle,
                      )),

                  rowData(
                      serialNum: '1',
                      title: 'Attendance',
                      marks: '5',
                      action: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: pink,
                          ))),

                  rowData(
                      serialNum: '2',
                      title: 'Homework',
                      marks: '5',
                      action: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, color: pink))),

                  rowData(
                      serialNum: '3',
                      title: 'Classwork',
                      marks: '5',
                      action: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, color: pink))),

                  rowData(
                      serialNum: '4',
                      title: 'Discipline',
                      marks: '5',
                      action: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, color: pink))),

                  rowData(
                      serialNum: '5',
                      title: 'Unit Test',
                      marks: '5',
                      action: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, color: pink))),

                  SizedBox(
                    width: 150,
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
                      child: Text(
                        'Submit',
                        style: buttonTitle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget rowData({
    required String serialNum,
    required String title,
    required String marks,
    required Widget action,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              serialNum,
              style: examRowTitle,
            ),
            Text(
              title,
              style: examRowTitle,
            ),
            SizedBox(width: 3.0,),
            Text(
              marks,
              style: examRowTitle,
            ),
            SizedBox(
              child: action,
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
