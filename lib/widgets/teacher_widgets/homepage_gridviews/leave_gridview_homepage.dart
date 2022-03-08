import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';

class LeaveInfo {
  final Widget icon;
  final String iconTitle;
  final Function onPress;

  LeaveInfo(
      {required this.onPress, required this.iconTitle, required this.icon});
}

Widget LeaveInfoGridView(BuildContext context){

  List<LeaveInfo> leaveChoice = [
    LeaveInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/approve_leave_request.png',
      ),
      iconTitle: 'Approve\n'
          'Leave Request',
      onPress: () {},
    ),
    LeaveInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/pending_leave.png',
      ),
      iconTitle: 'Pending\n'
          'Leave',
      onPress: () {},
    ),
    LeaveInfo(
      icon: Image.asset(
        'assets/teacher_homepage_icons/apply_leave.png',
      ),
      iconTitle: 'Apply\n'
          'Leave',
      onPress: () {},
    ),
  ];

  return Container(
    padding: EdgeInsets.only(bottom: 5),
    margin: EdgeInsets.symmetric(vertical: 5),
    height: MediaQuery.of(context).size.height * 0.23,
    child: Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'LEAVE',
              style: headingTitle
          ),
          SizedBox(
            height: 3.0,
          ),
          Flexible(
            child: GridView.count(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              crossAxisCount: 1,
              children: List.generate(leaveChoice.length, (index) {
                var leaveDetails = leaveChoice[index];
                return Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: orangeOne,
                            spreadRadius: 1,
                            blurRadius: 4,
                            blurStyle: BlurStyle.inner,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: Center(
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () =>
                                leaveDetails.onPress(),
                            icon: leaveDetails.icon,
                            iconSize: 50,
                          ),
                          Text(
                            leaveDetails.iconTitle,
                            style: iconTitle,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    ),
  );
}