import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/controller/routine_controller.dart';

class RoutineGetList extends StatefulWidget {
  const RoutineGetList({Key? key}) : super(key: key);

  @override
  _RoutineGetListState createState() => _RoutineGetListState();
}

class _RoutineGetListState extends State<RoutineGetList> {
  final routineController = Get.put(RoutineController());

  @override
  Widget build(BuildContext context) {
    return GetX<RoutineController>(builder: (controller) {
      return SafeArea(
        child:  ListView.builder(
          padding: EdgeInsets.only(top: 10.0),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: controller.routineList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only( left: 10.0, right: 10.0, bottom: 10),
                  padding: EdgeInsets.only(top: 10.0, right: 25),
                  height: MediaQuery.of(context).size.height /2.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(width: 30.0,),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 100,
                              width: 100,
                              image:
                              AssetImage(controller.routineList[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(width: 45.0,),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  controller.routineList[index].title.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      height: 1.2,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                              Text(controller.routineList[index].classType,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black45,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 33.0),

                          Expanded(
                            flex: 2,
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.0),

                                Padding(
                                  padding: EdgeInsets.only(bottom: 3.0),
                                  child: Text(
                                    controller.routineList[index].subject,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ),
                                Text(controller.routineList[index].subjectType,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black45,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.0),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 3.0, top: 5.0),
                                  child: Text(
                                    controller.routineList[index].teacher,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ),
                                Text(controller.routineList[index].teacherName,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black45,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),

                          ),
                        ],
                      ),


                      Container(
                        margin: EdgeInsets.only( left: 33, bottom: 5.0, top: 15.0),
                        padding: EdgeInsets.only(left: 7.0, top: 5.0, bottom: 5.0),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.black38,
                        ),
                        child: Text(
                          controller.routineList[index].time ,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                        ),

                      ),


                    ],
                  ),
                );
              }),

      );

    });
  }
}
