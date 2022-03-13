import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/teachers/home_page/grid_pages/homework_gridpage/add_homework.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';

// ignore: must_be_immutable
class HomeworkListTable extends StatelessWidget {
  HomeworkListTable(
      {Key? key,
      required this.title,
      required this.title2,
      this.textColor,
      this.containerColor,
        required this.deleteOnPress,
        required this.editOnPress,
      })
      : super(key: key);

  final String title;

  final String title2;
  final Function  editOnPress;
  final Function  deleteOnPress;
  Color? containerColor;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppbar(
            color: pink,
            icon: Icons.arrow_back,
            title: title,
            onPress: () {
              Get.back();
            }),
      ),
      body: ListView(
        // padding: EdgeInsets.symmetric(horizontal: 7),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            margin: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
            height: MediaQuery.of(context).size.height * 0.065,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: containerColor == null ? Colors.transparent : containerColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                title2,
                style: TextStyle(
                    fontSize: 18,
                    color: textColor == null ? pink : textColor,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.pink.shade300, width: 0.5),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'S.N',
                        style: ecaRowTitle,
                      ),
                      Text(
                        'Class',
                        style: ecaRowTitle,
                      ),
                      Text(
                        'Subject',
                        style: ecaRowTitle,
                      ),
                      Text(
                        'Submitted',
                        style: ecaRowTitle,
                      ),
                      Text(
                        'Action',
                        style: ecaRowTitle,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 5),
                    child: Divider(
                      thickness: 1,
                      height: 1,
                      color: pink,
                    ),
                  ),
                  buildRowDetails(
                    serialNum: '1',
                    classs: '1-A',
                    subject: 'English',
                    submit: '0/26',
                    action: Icon(
                      Icons.edit,
                      color: pink,
                    ),
                    action2: Icon(
                      Icons.delete,
                      color: pink,
                    ),
                  ),
                  buildRowDetails(
                    serialNum: '2',
                    classs: '4-B',
                    subject: 'English',
                    submit: '0/26',
                    action: Icon(
                      Icons.edit,
                      color: pink,
                    ),
                    action2: Icon(
                      Icons.delete,
                      color: pink,
                    ),
                  ),
                  buildRowDetails(
                    serialNum: '3',
                    classs: '10-D',
                    subject: 'English',
                    submit: '0/26',
                    action: Icon(
                      Icons.edit,
                      color: pink,
                    ),
                    action2: Icon(
                      Icons.delete,
                      color: pink,
                    ),
                  ),
                  buildRowDetails(
                    serialNum: '4',
                    classs: '7-A',
                    subject: 'English',
                    submit: '0/26',
                    action: Icon(
                      Icons.edit,
                      color: pink,
                    ),
                    action2: Icon(
                      Icons.delete,
                      color: pink,
                    ),
                  ),
                  buildRowDetails(
                    serialNum: '5',
                    classs: '8-C',
                    subject: 'English',
                    submit: '0/26',
                    action:Icon(
                      Icons.edit,
                      color: pink,
                    ),
                    action2: Icon(
                      Icons.delete,
                      color: pink,
                    ),
                  ),
                  buildRowDetails(
                    serialNum: '6',
                    classs: '4-D',
                    subject: 'English',
                    submit: '0/26',
                    action: Icon(
                      Icons.edit,
                      color: pink,
                    ),
                    action2: Icon(
                      Icons.delete,
                      color: pink,
                    ),
                  ),
                  buildRowDetails(
                    serialNum: '7',
                    classs: '5-B',
                    subject: 'English',
                    submit: '0/26',
                    action: Icon(
                      Icons.edit,
                      color: pink,
                    ),
                    action2: Icon(
                      Icons.delete,
                      color: pink,
                    ),
                  ),
                  buildRowDetails(
                    serialNum: '8',
                    classs: '9-D',
                    subject: 'English',
                    submit: '0/26',
                    action:Icon(
                      Icons.edit,
                      color: pink,
                    ),
                    action2: Icon(
                      Icons.delete,
                      color: pink,
                    ),
                  ),
                  buildRowDetails(
                    serialNum: '9',
                    classs: '6-A',
                    subject: 'English',
                    submit: '0/26',
                    action: Icon(
                      Icons.edit,
                      color: pink,
                    ),
                    action2: Icon(
                      Icons.delete,
                      color: pink,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRowDetails({
    required String serialNum,
    required String classs,
    required String subject,
    required String submit,
    required Widget action,
    required Widget action2,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              serialNum,
              style: textStyle,
            ),
            Text(
              classs,
              style: textStyle,
            ),
            Text(
              subject,
              style: textStyle,
            ),
            Text(
              submit,
              style: textStyle,
            ),
            SizedBox(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => deleteOnPress() == null ?  Get.to(() => AddHomework(
                        title: 'Edit Homework',
                        onPress: () {
                          Get.to(() => HomeworkListTable(
                            title: 'Homework List',
                            title2: 'Homework Edited',
                            containerColor: Colors.green.shade300,
                            textColor: Colors.white,
                            deleteOnPress: (){},
                            editOnPress: (){},
                          ));
                        })) : deleteOnPress(),
                    child: action,
                  ),
                  GestureDetector(
                    onTap: () => editOnPress() == null ? Get.to(() => AddHomework(
                        title: 'Edit Homework',
                        onPress: () {
                          Get.to(() => HomeworkListTable(
                            title: 'Homework List',
                            title2: 'Homework Deleted',
                            containerColor: Colors.red.shade300,
                            textColor: Colors.white,
                            editOnPress: (){},
                            deleteOnPress: (){},
                          ));
                        }) ) : editOnPress (),
                    child: action2,
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 5),
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
