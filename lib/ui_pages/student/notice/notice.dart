import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_project_work/controller/notice/notice_controller.dart';

import 'package:new_project_work/ui_pages/student/widget/profile_body_container.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class Notice extends StatefulWidget {
  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final NoticeController noticeController = Get.put(NoticeController());
  bool load = false;
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);


    super.build(context);
    return Scaffold(
        body: ProfileBodyContainer(
            widget: Obx(
              () {
                return Container(
                  height: MediaQuery.of(context).size.height / 1.58,
                  child: noticeController.isloading.value
                      ? Shimmer.fromColors(
                          // baseColor: Colors.grey.shade400,
                          period: const Duration(milliseconds: 500),
                          // highlightColor: Colors.grey.shade300,
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ListView.builder(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 5.0),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            const BorderRadius.vertical(
                                                top: const Radius.circular(10),
                                                bottom: Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: orangeOne,
                                            // spreadRadius: 5,
                                            blurRadius: 4,
                                            blurStyle: BlurStyle.inner,
                                            offset: const Offset(0, 3),
                                          ),
                                        ]),
                                    child: ExpansionTile(
                                      initiallyExpanded:
                                          index == 0 ? true : false,
                                      title: Container(
                                        height: 20,
                                        width: double.infinity,
                                      ),
                                      subtitle: Container(
                                        height: 20,
                                        width: double.infinity,
                                      ),
                                      children: [
                                        Container(
                                          height: 200,
                                          width: double.infinity,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )

                      // ? Center(child: CircularProgressIndicator())
                      : SmartRefresher(
                          controller: noticeController.refreshController,
                          enablePullUp: true,
                          enablePullDown: false,
                          onLoading: () async {
                            if (noticeController.lastpage.value == false) {
                              final result = await noticeController.getNotice();
                              if (result) {
                                noticeController.refreshController
                                    .loadComplete();
                              } else {
                                noticeController.refreshController.loadFailed();
                              }
                            } else {
                              noticeController.refreshController.loadNoData();
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
                                  itemCount: noticeController.noticeList.length,
                                  itemBuilder: (context, index) {
                                    var myitem =
                                        noticeController.noticeList[index];
                                    log(noticeController.noticeList.length
                                        .toString());
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: const BorderRadius
                                                    .vertical(
                                                top: const Radius.circular(10),
                                                bottom: Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: orangeOne,
                                                // spreadRadius: 5,
                                                blurRadius: 4,
                                                blurStyle: BlurStyle.inner,
                                                offset: const Offset(0, 3),
                                              ),
                                            ]),
                                        child: ExpansionTile(
                                          initiallyExpanded:
                                              index == 0 ? true : false,
                                          title: Text(myitem.noticeTitle),
                                          subtitle: Text(
                                              DateFormat('yyyy-MM-dd – hh:mm')
                                                  .format(myitem.noticeDate)
                                                  .toString()),
                                          children: [
                                            Html(data: myitem.noticeMessage)
                                          ],
                                        ),

                                        //  ExpandablePanel(
                                        //   theme: const ExpandableThemeData(
                                        //       iconColor: Color(0xffFC6075),
                                        //       expandIcon: Icons.add,
                                        //       collapseIcon: Icons.minimize),
                                        //   header: Padding(
                                        //     padding: EdgeInsets.all(5.0),
                                        //     child: Text(
                                        //       myitem.noticeTitle,
                                        //       style: TextStyle(
                                        //           height: 1.5,
                                        //           color: Color(0xffFC6075),
                                        //           fontWeight: FontWeight.bold),
                                        //     ),
                                        //   ),
                                        //   collapsed: const Text(
                                        //     '',
                                        //     softWrap: true,
                                        //     maxLines: 1,
                                        //     overflow: TextOverflow.ellipsis,
                                        //   ),
                                        //   expanded: Column(
                                        //     children: [
                                        //       Html(data: myitem.noticeMessage),
                                        //     ],
                                        //     // children: List.generate(
                                        //     //   _listOfUserCourses.length,
                                        //     //   (int index) {
                                        //     //     var accountData = _listOfUserCourses[index];
                                        //     //     return InkWell(
                                        //     //       onTap: () {
                                        //     //         Navigator.push(
                                        //     //             context,
                                        //     //             MaterialPageRoute(
                                        //     //                 builder: (context) =>
                                        //     //                     SingleProductPage(
                                        //     //                         libraryItems:
                                        //     //                             accountData)));
                                        //     //       },
                                        //     //       child: Card(
                                        //     //         elevation: 0.5,
                                        //     //         child: ListTile(
                                        //     //           leading: Image.network(accountData.image),
                                        //     //           title: Text(accountData.title.toString()),
                                        //     //         ),
                                        //     //       ),
                                        //     //     );
                                        //     //   },
                                        //     // ),
                                        //   ),
                                        // ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                );
              },
            ),
            text: 'Today Notice'));
  }
}
