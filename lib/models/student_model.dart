import 'package:excel_public_school/utils/color.dart';
import 'package:flutter/cupertino.dart';

class StudentModel{
  final String title;
  final String answer;

  StudentModel({required this.title, required this.answer});
}
List<StudentModel> model1 = [
  StudentModel(title: 'Class ', answer: 'UKG'),
  StudentModel(title: 'Section ', answer: 'A'),
  StudentModel(title: 'Email ', answer: 'std11@mail.com'),
  StudentModel(title: 'Admission No. ', answer: '001'),
];

const titleStyle = TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'Roboto',color: Color(0xFFF06292));
const answerStyle = TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Roboto',color: Color(0xFFF06292));