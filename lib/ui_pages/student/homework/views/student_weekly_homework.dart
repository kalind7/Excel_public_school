import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/homework/controller/student_homework_controller.dart';
import 'package:new_project_work/ui_pages/student/homework/views/student_homework_container.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StudentWeeklyHomework extends StatelessWidget {
  StudentWeeklyHomework({Key? key}) : super(key: key);

  final StudentHomeworkController studentHomeworkController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => studentHomeworkController.isloading.value
          ? Center(child: CircularProgressIndicator())
          : SmartRefresher(
              controller: studentHomeworkController.weeklyRefreshController,
              enablePullUp: true,
              enablePullDown: true,
              onRefresh: () async {
                await studentHomeworkController.getHomeWorkWeekly(
                    isRefresh: true);
                studentHomeworkController.weeklyRefreshController
                    .refreshCompleted();
              },
              onLoading: () async {
                if (studentHomeworkController.weeklyLastpage.value == false) {
                  final result = await studentHomeworkController
                      .getHomeWorkWeekly(islLoading: true);
                  if (result) {
                    studentHomeworkController.weeklyRefreshController
                        .loadComplete();
                  } else {
                    studentHomeworkController.weeklyRefreshController
                        .loadFailed();
                  }
                } else {
                  studentHomeworkController.weeklyRefreshController
                      .loadNoData();
                }
              },
              child: ListView(
                children: [
                  ListView.builder(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      itemCount:
                          studentHomeworkController.weeklyHomeworkList.length,
                      itemBuilder: (context, index) {
                        var myitem =
                            studentHomeworkController.weeklyHomeworkList[index];

                        // log(studentHomeworkController.weeklyHomeworkList.length.toString());
                        return studentHomeworkController
                                .weeklyHomeworkList.isEmpty
                            ? Center(
                                child: Text('No homework available'),
                              )
                            : homeworkContainer(context, myitem);
                      }),
                ],
              ),
            ),
    );
  }
}
