import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/homework/controller/student_homework_controller.dart';
import 'package:new_project_work/ui_pages/student/homework/views/student_homework_container.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StudentHomework extends StatelessWidget {
  StudentHomework({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final StudentHomeworkController studentHomeworkController =
      Get.put(StudentHomeworkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        key: _scaffoldKey,
        body: Obx(
          () => BodyWithWidgetContainer(
              bodyWidget: Container(
                height: MediaQuery.of(context).size.height / 1.45,
                child: studentHomeworkController.isloading.value
                    ? CircularProgressIndicator()
                    : SmartRefresher(
                        controller: studentHomeworkController.refreshController,
                        enablePullUp: true,
                        enablePullDown: false,
                        onLoading: () async {
                          if (studentHomeworkController.lastpage.value ==
                              false) {
                            final result =
                                await studentHomeworkController.getHomeWork();
                            if (result) {
                              studentHomeworkController.refreshController
                                  .loadComplete();
                            } else {
                              studentHomeworkController.refreshController
                                  .loadFailed();
                            }
                          } else {
                            studentHomeworkController.refreshController
                                .loadNoData();
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
                                itemCount: studentHomeworkController
                                    .homeworkList.length,
                                itemBuilder: (context, index) {
                                  var myitem = studentHomeworkController
                                      .homeworkList[index];

                                  // log(studentHomeworkController.homeworkList.length.toString());
                                  return studentHomeworkController
                                          .homeworkList.isEmpty
                                      ? Center(
                                          child: Text('No homework available'),
                                        )
                                      : homeworkContainer(context, myitem);
                                }),
                          ],
                        ),
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
              uppderWidget: Row(
                children: [
                  Text('from'),
                  Text('to'),
                ],
              )),
        ));
  }
}
