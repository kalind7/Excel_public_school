import 'package:excel_public_school/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Choice{
  final String title;
  final Widget icon;

  Choice({required this.title, required this.icon});
}
List<Choice> choice = <Choice>[
  Choice(title: 'Files', icon: Image.asset('files/homework_icons/files.png')),
  Choice(title: 'Upload', icon: Image.asset('files/homework_icons/upload.png')),
  Choice(title: 'Download', icon: Image.asset('files/homework_icons/download.png')),
  Choice(title: 'Submit', icon: Image.asset('files/homework_icons/submit.png')),
];

Widget homeworkContainer(BuildContext context){
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    height: MediaQuery.of(context).size.height * 0.3,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: orangeOne,
          spreadRadius: 0.8,
          blurRadius: 4,
          blurStyle: BlurStyle.inner,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 3),
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: HexColor('#EDF2F9'),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Center(child: Text('Math',style: subjectTitle,),),
        ),
        Container(
          margin: const EdgeInsets.only(top: 7.0),
          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width /1.2,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text('Homework Date',style: homeworkTitle,),
                  Text('2022-01-01',style: dateTitle,),
                ],
              ),
              Column(
                children: const [
                  Text('Submission Date',style: homeworkTitle,),
                  Text('2022-01-08',style: dateTitle,),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 10),
          child: Divider(
            height: 2,
            thickness: 2,
            color: pinkOne,
          ),
        ),

        Flexible(
          fit: FlexFit.tight,
          child: GridView.count(
            padding: const EdgeInsets.fromLTRB(10,5,10,50),
            crossAxisCount: 4,
            crossAxisSpacing:10.0,
            children: List.generate(choice.length, (index) {
              return  Center(child: SelectCard(choices: choice[index]),);
            }),
          ),
        )
      ],
    ),
  );
}


class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choices}) : super(key: key);

  final Choice choices;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            colors: [Colors.white70, orangeOne],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(onPressed: (){},icon: choices.icon,),
              Text(choices.title, style: const TextStyle(fontSize: 14,color: Colors.black)),
            ]
        ),
        ),
      ),
    );
  }
}

