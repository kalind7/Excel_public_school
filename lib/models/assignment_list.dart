import 'package:flutter/cupertino.dart';

class AssignmentList {
  final String question;
  final IconData icon4;
  final IconData icon1;
  final IconData icon2;
  final String subject;
  final String teacherName;
  final String deadline;
  final IconData icon3;
  final Function onpress;

  AssignmentList(
      {required this.question,
      required this.icon1,
      required this.icon2,
      required this.subject,
      required this.teacherName,
      required this.deadline,
      required this.icon3,
        required this.icon4,
      required this.onpress

      });
}
