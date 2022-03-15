import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:new_project_work/ui_pages/student/homework/controller/student_homework_controller.dart';
import 'package:new_project_work/ui_pages/student/homework/model/submitted_homework_model.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/constant.dart';

Widget submittedWork(BuildContext context, List<HomeworkUploadDetail>? data) {
  final StudentHomeworkController studentHomeworkController =
      Get.find<StudentHomeworkController>();
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return Dialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      height: height * 0.5,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: orangeOne,
              // spreadRadius: 5,
              blurRadius: 4,
              blurStyle: BlurStyle.inner,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 2.0),
            padding: EdgeInsets.symmetric(horizontal: 7),
            height: height * 0.09,
            decoration: BoxDecoration(
              color: pink,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Submitted Work',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                  ),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
            child: data!.isEmpty
                ? Center(
                    child: Text("No work Submitted"),
                  )
                : Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      var myitem = data[index];
                      return Column(
                        children: [
                          SizedBox(
                            height: height * 0.15,
                            child: CachedNetworkImage(
                              height: 100,
                              width: 200,
                              fit: BoxFit.cover,
                              imageUrl: myitem.file!,
                              placeholder: (context, url) => SizedBox(
                                height: 150,
                                width: 150,
                                child: Center(
                                  child: LiquidCircularProgressIndicator(
                                    value: 0.35,
                                    valueColor: AlwaysStoppedAnimation(pink),
                                    backgroundColor: white,
                                    borderColor: orangeOne,
                                    borderWidth: 5.0,
                                    direction: Axis.vertical,
                                    center: Text("Loading..."),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                            ),

                            // Image.network(
                            //   myitem.file!,
                            //   // fit: BoxFit.contain,
                            // ),
                          ),
                          Container(
                            height: 130,
                            child: SingleChildScrollView(
                              child: myitem.comment != null
                                  ? Column(
                                      children: [
                                        Text(
                                          'Teachers Comments:',
                                          style: titleStyle,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text(
                                            myitem.comment,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Center(child: Text("No Comments")),
                                    ),
                            ),
                          )
                        ],
                      );
                    },
                    itemCount: data.length,
                    // pagination: SwiperPagination(),
                    control: SwiperControl(),
                  ),
          ),
        ],
      ),
    ),
  );
}
