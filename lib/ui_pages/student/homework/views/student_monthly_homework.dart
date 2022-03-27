import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/homework/controller/student_homework_controller.dart';
import 'package:new_project_work/ui_pages/student/homework/views/student_homework_container.dart';
import 'package:new_project_work/widgets/simmer/homework_shimmer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StudentMonthlyHomework extends StatelessWidget {
  StudentMonthlyHomework({Key? key}) : super(key: key);

  final StudentHomeworkController studentHomeworkController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => studentHomeworkController.isloading.value
          ? CircularProgressIndicator()
          : SmartRefresher(
              controller: studentHomeworkController.monthlyRefreshController,
              enablePullUp: true,
              enablePullDown: true,
              onRefresh: () async {
                studentHomeworkController.monthlyCurrentPage.value = 1;
                // studentHomeworkController.monthlyHomeworkList.clear();
                await studentHomeworkController.getHomeworkMontly(
                    isRefresh: true);
                studentHomeworkController.monthlyRefreshController
                    .refreshCompleted();
              },
              onLoading: () async {
                if (studentHomeworkController.monthlyLastpage.value == false) {
                  final result = await studentHomeworkController
                      .getHomeworkMontly();
                  if (result) {
                    studentHomeworkController.monthlyRefreshController
                        .loadComplete();
                  } else {
                    studentHomeworkController.monthlyRefreshController
                        .loadFailed();
                  }
                } else {
                  studentHomeworkController.monthlyRefreshController
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
                          studentHomeworkController.monthlyHomeworkList.length,
                      itemBuilder: (context, index) {
                        var myitem = studentHomeworkController
                            .monthlyHomeworkList[index];

                        // log(studentHomeworkController.todayHomeworkList.length.toString());
                        return studentHomeworkController
                                .monthlyHomeworkList.isEmpty
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
