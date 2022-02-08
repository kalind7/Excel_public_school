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
      return Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: controller.routineList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                padding: EdgeInsets.only(top: 10.0),
                height: MediaQuery.of(context).size.height /3,
                width: MediaQuery.of(context).size.width / 1.15,
                decoration: BoxDecoration(
                  color: Colors.blue,
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

                        SizedBox(width: 30.0,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.routineList[index].title,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'MontserratAlternates'),
                            ),
                            Text(controller.routineList[index].classType,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white60,
                                    fontFamily: 'MontserratAlternates',
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),

                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 10.0,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.routineList[index].subject,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white60,
                                  fontFamily: 'MontserratAlternates'),
                            ),
                            Text(controller.routineList[index].subjectType,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontFamily: 'MontserratAlternates',
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),


                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.routineList[index].teacher,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white60,
                                  fontFamily: 'MontserratAlternates'),
                            ),
                            Text(controller.routineList[index].teacherName,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontFamily: 'MontserratAlternates',
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 10.0, left: 33),
                      padding: EdgeInsets.only(left: 7.0),
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.black38,
                      ),
                      child: Row(
                        children: [
                          Text(
                            controller.routineList[index].time ,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'MontserratAlternates',
                            ),
                          ),
                        ],
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
