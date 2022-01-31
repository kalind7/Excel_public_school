import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_project_work/controller/student_controller.dart';

class BuildList extends StatefulWidget {
  const BuildList({Key? key}) : super(key: key);

  @override
  _BuildListState createState() => _BuildListState();
}

class _BuildListState extends State<BuildList> {

  final studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students List'),
        centerTitle: true,
      ),

      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:Column(
              children: [
                GetX<StudentController>(
                    builder: (controller){
                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.studentList.length,
                          itemBuilder: (context, index){
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child:Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: HexColor("#F4F4F4"),
                                ),

                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10.0),
                                      child:  ClipRRect(
                                        borderRadius: BorderRadius.circular(15.0),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Hero(
                                            tag: AssetImage('images/profile.png'),
                                            child: Image(
                                              height: 100,
                                              width: 50,
                                              fit: BoxFit.cover,
                                              image: AssetImage('images/profile.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Name: ${controller.studentList[index].name}', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                          SizedBox(height: 4.0),
                                          Text('Class: ${controller.studentList[index].Class}',  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),),
                                          SizedBox(height: 4.0),
                                          Text('Roll No: ${controller.studentList[index].roll}',  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),),
                                          SizedBox(height: 4.0),
                                          Text('E-mail: ${controller.studentList[index].email}',  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),


                              ),
                            );
                          }
                      );

                    }
                ),


              ],
            ),
          ),
        ],
      ),

      // ListView(
      //   scrollDirection: Axis.vertical,
      //   children: <Widget>[
      //     Container(
      //       height: 150.0,
      //       width: 100.0,
      //       margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(15.0),
      //         color: Colors.white,
      //         border: Border.all(color: Colors.grey, width: 1.0)
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //          Padding(
      //            padding: EdgeInsets.symmetric(vertical: 10.0),
      //            child:  ClipRRect(
      //              borderRadius: BorderRadius.circular(15.0),
      //              child: GestureDetector(
      //                onTap: (){},
      //
      //                child: Image(
      //                  height: 100,
      //                  width: 50,
      //                  fit: BoxFit.cover,
      //                  image: AssetImage('images/profile.png'),
      //                ),
      //              ),
      //            ),
      //          ),
      //
      //           Container(
      //             margin: EdgeInsets.symmetric(vertical: 10.0),
      //             child: Column(
      //               // mainAxisAlignment: MainAxisAlignment.center,
      //               // crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text('student.name', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
      //                 SizedBox(height: 4.0),
      //                 Text('student.Class',  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),),
      //                 SizedBox(height: 4.0),
      //                 Text('student.roll',  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),),
      //                 SizedBox(height: 4.0),
      //                 Text('student.email',  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),),
      //               ],
      //             ),
      //           ),
      //
      //
      //
      //         ],
      //       ),
      //
      //     ),
      //   ],
      // ),
    );
  }
}




