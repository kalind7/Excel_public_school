import 'package:flutter/material.dart';
import 'package:new_project_work/models/assignment_list.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/appbar.dart';


class Assignment extends StatelessWidget {
  const Assignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AssignmentList> assignmentList = [
      AssignmentList(
        icon1: Icons.question_answer,
        question:
            'Chapter 3 - Q.no 1 - Q.no 10\n(Please submit in word format \nwith names attached)',
        icon2: Icons.book,
        subject: 'Mathematics',
        icon3: Icons.person,
        teacherName: 'Mr. Ram Prasad Yadav',
        deadline: 'DEADLINE: 14 Feb, 2022',
        icon4: Icons.upload_rounded,
        onpress: () {
          print('anything');
        },
      ),
      AssignmentList(
        icon1: Icons.question_answer,
        question:
            'Chapter 3 - Q.no 1 - Q.no 10\n(Please submit in word format \nwith names attached)',
        icon2: Icons.book,
        subject: 'Physics',
        icon3: Icons.person,
        teacherName: 'Mr. Hari Prasad Acharya',
        deadline: 'DEADLINE:  14 Feb, 2022',
        icon4: Icons.upload_rounded,
        onpress: () {
          print('anything');
        },
      ),
      AssignmentList(
        icon1: Icons.question_answer,
        question:
            'Chapter 3 - Q.no 1 - Q.no 10\n(Please submit in word format \nwith names attached)',
        icon2: Icons.book,
        subject: 'Mathematics',
        icon3: Icons.person,
        teacherName: 'Mr. Ram Prasad Yadav',
        deadline: 'DEADLINE: 14 Feb, 2022',
        icon4: Icons.upload_rounded,
        onpress: () {
          print('anything');
        },
      ),
    ];

    return Scaffold(
      appBar: PreferredSize(child: WidgetAppbar(title: 'Assignment', onPress: (){Navigator.pop(context);}, icon: Icons.arrow_back), preferredSize: Size.fromHeight(55.0),),
      body: ListView.builder(
          itemCount: assignmentList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              padding: EdgeInsets.only(top: 15.0),
              height: MediaQuery.of(context).size.height / 3.25,
              // width: MediaQuery.of(context).size.width / 1.15,
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: orangeOne, width: 0.5),
                  boxShadow: [
                    BoxShadow(
                      color: orangeOne.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset:
                      Offset(4, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(assignmentList[index].icon1, size: 18),
                      Text(
                        assignmentList[index].question,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontFamily: 'OpenSans'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20.0,
                      ),
                      Icon(
                        assignmentList[index].icon2,
                        size: 18,
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        assignmentList[index].subject,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38,
                            fontFamily: 'OpenSans'),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20.0,
                      ),
                      Icon(
                        assignmentList[index].icon3,
                        size: 18,
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        assignmentList[index].teacherName,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38,
                            fontFamily: 'OpenSans'),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 20.0),
                        padding: EdgeInsets.only(left: 10.0, top: 3),
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.black38,
                        ),
                        child: Text(
                          assignmentList[index].deadline,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white54,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 3.0, top: 7.0),
                        child: IconButton(
                          onPressed: () {
                            assignmentList[index].onpress();
                          },
                          icon: Icon(
                            assignmentList[index].icon4,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
