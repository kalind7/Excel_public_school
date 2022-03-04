// import 'package:buttons_tabbar/buttons_tabbar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_project_work/ui_pages/student/homework/controller/image_controller.dart';
// import 'package:new_project_work/ui_pages/student/homework/widget/student_homework_container.dart';
// import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
// import 'package:new_project_work/utils/color.dart';
// import 'package:new_project_work/utils/fonts.dart';
// import 'package:new_project_work/widgets/appbar.dart';
// import 'package:new_project_work/widgets/simmer/homework_shimmer.dart';
//
// class StudentHomework extends StatefulWidget {
//   StudentHomework({Key? key}) : super(key: key);
//
//   @override
//   _StudentHomeworkState createState() => _StudentHomeworkState();
// }
//
// class _StudentHomeworkState extends State<StudentHomework>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//
//   @override
//   void initState() {
//     tabController = TabController(length: 3, vsync: this);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }
//
//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   ImageController imageController = Get.put(ImageController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         extendBodyBehindAppBar: true,
//         key: _scaffoldKey,
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(55.0),
//           child: WidgetAppbar(
//             icon: Icons.refresh,
//             title: 'Homework',
//             onPress: (){
//               imageController.fetchDetails();
//             },
//           ),
//
//         ),
//         body: BodyWithWidgetContainer(
//           top: 100,
//           upperWidget:ButtonsTabBar(
//               controller: tabController,
//               backgroundColor: pink,
//               unselectedBackgroundColor: Colors.grey[300],
//               radius: 5,
//               tabs: const [
//                 Tab(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Text(
//                         'Today',
//                         style: tabTitle,
//                       ),
//                     )),
//                 Tab(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Text(
//                         'Weekly',
//                         style: tabTitle,
//                       ),
//                     )),
//                 Tab(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Text('Monthly', style: tabTitle),
//                     )),
//               ]),
//
//           bodyWidget: TabBarView(
//               controller: tabController,
//               children: [
//                 Obx(
//                       () => imageController.isLoading.value
//                       ? HomeworkShimmer()
//                       : HomeworkContainer(),
//                 ),
//                 Center(
//                   child: Text('Weekly View'),
//                 ),
//                 Center(
//                   child: Text('Monthly View'),
//                 ),
//               ]),
//         ));
//   }
// }
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/homework/controller/student_homework_controller.dart';
import 'package:new_project_work/ui_pages/student/homework/views/student_homework_container.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/simmer/homework_shimmer.dart';
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
        appBar: PreferredSize(child: WidgetAppbar(
          title: '',
          onPress: (){
            studentHomeworkController.fetchDetails();
          },
          icon: Icons.refresh,
        ),
            preferredSize: Size.fromHeight(55.0)),
        key: _scaffoldKey,
        body: Obx(
              () => BodyWithWidgetContainer(
                top: 100,

                upperWidget: DefaultTabController(
                    length: 3,
                    child: ButtonsTabBar(

                    backgroundColor: pink,
                    unselectedBackgroundColor: Colors.grey[300],
                    radius: 5,
                    tabs: const [
                      Tab(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              'Today',
                              style: tabTitle,
                            ),
                          )),
                      Tab(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              'Weekly',
                              style: tabTitle,
                            ),
                          )),
                      Tab(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text('Monthly', style: tabTitle),
                          )),
                    ])),

              bodyWidget: Container(
                height: MediaQuery.of(context).size.height / 1.45,
                child: studentHomeworkController.isloading.value
                    ?  HomeworkShimmer()
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
              ),
        ));
  }
}