// import 'package:filter_list/filter_list.dart';
// import 'package:flutter/material.dart';
// import 'package:new_project_work/models/teacher_list.dart';
//
// class FilterPage extends StatelessWidget {
//   const FilterPage({Key? key, this.selectedTeacherList}) : super(key: key);
//
//   final List<TeacherDetails>? selectedTeacherList;
//
//   @override
//   Widget build(BuildContext context) {
//     return FilterListWidget<TeacherDetails>(
//       listData: teacherList,
//         selectedListData: selectedTeacherList,
//         onApplyButtonClick: (list){},
//         choiceChipLabel: (item){
//         return item!.name;
//         },
//         validateSelectedItem: (list, val){
//         return list!.contains(val);
//         },
//         onItemSearch: (user, query){
//         return user.name.toLowerCase().contains(query.toLowerCase());
//         }
//     );
//   }
// }
//
// List<TeacherDetails> teacherList = [
//   TeacherDetails(
//       name: 'Mr. Ram Prasad Yadav',
//       degree: 'Mathematics ',
//       email: 'ramprasad@gmail.com',
//       image: 'images/profile.png',
//       number: '9860052311'
//   ),
//   TeacherDetails(
//       name: 'Mr. Hari Prasad Acharya',
//       degree: 'Science',
//       email: 'hari22@gmail.com',
//       image: 'images/profile.png',
//       number: '9860052323'
//   ),
//   TeacherDetails(
//       name: 'Mrs. Laxmi Bhandari',
//       degree: 'Social',
//       email: 'iamlaxmi@gmail.com',
//       image: 'images/profile.png',
//       number: '9860052445'
//   ),
//   TeacherDetails(
//       name: 'Mr. Kamal Khatri',
//       degree: 'Computer Science',
//       email: 'kk18@gmail.com',
//       image: 'images/profile.png',
//       number: '9860056454'
//   ),
//   TeacherDetails(
//       name: 'Mr. Kalind Koirala',
//       degree: 'Optional Mathematics',
//       email: 'kk17@gmail.com',
//       image: 'images/profile.png',
//       number: '98600323232'
//   ),
//   TeacherDetails(
//       name: 'Mrs. Shanta Banjade',
//       degree: 'Nepali',
//       email: 'sb45@gmail.com',
//       image: 'images/profile.png',
//       number: '98600532312'
//   ),
// ];
