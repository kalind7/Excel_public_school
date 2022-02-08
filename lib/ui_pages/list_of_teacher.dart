import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_project_work/controller/student_controller.dart';
import 'package:new_project_work/widgets/admin_bio.dart';
import 'package:new_project_work/widgets/drop_down.dart';
import 'package:new_project_work/widgets/logout_popup.dart';
import 'package:new_project_work/widgets/text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class TeacherLists extends StatefulWidget {
  const TeacherLists({Key? key}) : super(key: key);

  @override
  _TeacherListsState createState() => _TeacherListsState();
}

class _TeacherListsState extends State<TeacherLists> {
  final teacherController = Get.put(StudentController());

  void _launchCaller(int number)async{
    var url = "tel:${number.toString()}";
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw "Could not place call";
    }
  }
  void _launchEmail(String emailId)async{
    var url = "mailto:$emailId?subject= Email Button done";
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw "Could not send email";
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24.0,
            color: Colors.black87,
          ),
        ),
        title: Text('Teacher List',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'MontserratAlternates',
                color: Colors.white)),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 3.0, top: 2.0),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => BuildPopupDialog(),
                );
              },
              icon: Icon(Icons.power_settings_new,
                  size: 24.0, color: Colors.black87),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height:10.0),
          DropDown(),

          Column(
            children: [
              GetX<StudentController>(builder: (controller) {
                return ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.teacherList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                        padding: EdgeInsets.only(top: 10.0, left: 10.0),
                        height: MediaQuery.of(context).size.height / 3.25,
                        decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.5),
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
                              children: [
                                SizedBox(width: 20.0),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AdminBio(
                                              text: 'New Teacher',
                                              bio:
                                                  'I am teacher of class 4 and am teaching hardly to complete my primary courses.',
                                              jobtitle: 'Job',
                                              answer1: 'Teacher',
                                              length: 'Class',
                                              answer2: '4',
                                              question: 'Teacher ?',
                                              answer3: 'Yes',
                                            ),
                                          ));
                                    },
                                    child: Image(
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          '${controller.teacherList[index].image}'),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(height: 15.0),
                                    Text(controller.teacherList[index].name,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'MontserratAlternates',
                                            color: Colors.black87)),
                                    SizedBox(height: 2.0),
                                    Text(controller.teacherList[index].degree,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'MontserratAlternates',
                                            color: Colors.black45)),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 7.0, right: 10.0),
                              padding: EdgeInsets.only(top: 5.0, left: 5.0),
                              height: MediaQuery.of(context).size.height * 0.18,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: HexColor('#F4F4F4'),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _launchEmail(controller.teacherList[index].email);
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(Icons.mail,
                                              color: Colors.black87),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 25.0,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('E-mail',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black45,
                                                    fontFamily:
                                                        'MontserratAlternates',
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text(
                                                '${controller.teacherList[index].email}',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black87,
                                                    fontFamily:
                                                        'MontserratAlternates',
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          _launchCaller(9860052311);
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(Icons.phone,
                                              color: Colors.black87),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 25.0,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Phone number :- ',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black45,
                                                    fontFamily:
                                                        'MontserratAlternates',
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text('9860052311',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black87,
                                                    fontFamily:
                                                        'MontserratAlternates',
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }),
            ],
          ),
        ],
      ),
    );
  }
}
