import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/homework/controller/student_homework_controller.dart';
import 'package:new_project_work/ui_pages/student/homework/views/student_homework_container.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StudentHomework extends StatelessWidget {
  StudentHomework({Key? key}) : super(key: key);



  final StudentHomeworkController studentHomeworkController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => studentHomeworkController.isloading.value
            ? Center(child: CircularProgressIndicator())
            : SmartRefresher(
                controller: studentHomeworkController.todayRefreshController,
                enablePullUp: true,
                enablePullDown: false,
                onLoading: () async {
                  if (studentHomeworkController.todayLastpage.value == false) {
                    final result =
                        await studentHomeworkController.getHomeWorkToday();
                    if (result) {
                      studentHomeworkController.todayRefreshController
                          .loadComplete();
                    } else {
                      studentHomeworkController.todayRefreshController.loadFailed();
                    }
                  } else {
                    studentHomeworkController.todayRefreshController.loadNoData();
                  }
                },
                child: ListView(
                  children: [
                    ListView.builder(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 5.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        itemCount:
                            studentHomeworkController.todayHomeworkList.length,
                        itemBuilder: (context, index) {
                          var myitem = studentHomeworkController
                              .todayHomeworkList[index];

                          // log(studentHomeworkController.todayHomeworkList.length.toString());
                          return studentHomeworkController
                                  .todayHomeworkList.isEmpty
                              ? Center(
                                  child: Text('No homework available'),
                                )
                              : homeworkContainer(context, myitem);
                        }),
                  ],
                ),
              ),
    

      // ListView(children: [
      //   // TextButton(
      //   //     onPressed: () {
      //   //       ApiServices().getWithToken('v2/homeworklist');
      //   //     },
      //   //     child: Text('get')),
      //   homeworkContainer(context),
      //   homeworkContainer(context),
      //   homeworkContainer(context),
      // ])),
    );
  }
}
