import 'dart:convert';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/global/alert.dart';
import 'package:new_project_work/ui_pages/student/homework/model/student_homework_model.dart';
import 'package:new_project_work/ui_pages/student/homework/model/submitted_homework_model.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:new_project_work/ui_pages/student/homework/views/submited_work_view.dart';
import 'package:new_project_work/utils/fonts.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class StudentHomeworkController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = const <Tab>[
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
  ];

  late TabController controller;
  @override
  void onClose() {
    controller.dispose();

    super.onClose();
  }

  var todayHomeworkList = <StudentHomeWorkData>[].obs;
  var weeklyHomeworkList = <StudentHomeWorkData>[].obs;
  var monthlyHomeworkList = <StudentHomeWorkData>[].obs;
  var todayCurrentPage = 1.obs;
  var weeklyCurrentPage = 1.obs;
  var monthlyCurrentPage = 1.obs;
  var submittedWorkList = <HomeworkUploadDetail>[].obs;

  final ImagePicker _picker = ImagePicker();
  var imageFileList = <XFile>[].obs;
  // XFile? imageFile = null.obs as XFile?;
  var isImagePathSet = false.obs;
  var profilePicPath = "".obs;

  var isloading = true.obs;
  var isUploading = false.obs;
  var isDownloading = false.obs;
  var duration = "";
  var lastpage = false.obs;
  var todayLastpage = false.obs;
  var weeklyLastpage = false.obs;
  var monthlyLastpage = false.obs;

  var isMoreDataAvailable = false.obs;
  final RefreshController todayRefreshController =
      RefreshController(initialRefresh: true);
  final RefreshController weeklyRefreshController =
      RefreshController(initialRefresh: false);
  final RefreshController monthlyRefreshController =
      RefreshController(initialRefresh: false);
  RxInt progress = 0.obs ;
  final ReceivePort receivePort = ReceivePort();

  @override
  void onInit() {
    fetchDetails();
    IsolateNameServer.registerPortWithName(receivePort.sendPort, "downloadPdf");
    receivePort.listen((message) {
      progress.value = message ;
        print(progress.value);
    });
    FlutterDownloader.registerCallback(downloadCallback);
    controller = TabController(vsync: this, length: myTabs.length);
    getHomeWorkToday();
    getHomeWorkWeekly();
    getHomeworkMontly();
    // paginateTask();
    super.onInit();
  }
  

 static downloadCallback(id, status, progress){
    SendPort? sendPort = IsolateNameServer.lookupPortByName("downloadPdf");
    sendPort!.send([id,status, progress]);
  }

  void downloadFile(String file) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      isDownloading.value = true;
      await Future.delayed(Duration(seconds: 3));
      final baseStorage = await getExternalStorageDirectory();

      print(baseStorage!.path);

      final id = await FlutterDownloader.enqueue(
          url: file,
          savedDir: baseStorage.path,
        fileName: 'Download File',
        saveInPublicStorage: true,
        headers: {"download": "testing"},
        showNotification: true,
        openFileFromNotification: true,
      );
    } else {
      Alert.showSnackBar(title: 'ERROR !!!' ,message: 'Couldn\'t show download', top: true);
    }
    isDownloading.value = false;
  }

  void fetchDetails() async{
    isloading.value = true;
    await Future.delayed(Duration(seconds: 3));
    isloading.value = false;
  }

  void uploadImage(homeworkId, XFile filepath) async {
    try {
      isUploading.value = true;
      var response = await ApiServices()
          .patchImage(ApiUrl.studentUploadHomework, homeworkId, filepath.path);

      if (response != null) {
        var res = jsonDecode(response);
        if (res["success"]) {
          Alert.showSnackBar(
              title: 'Success', message: res['message'].toString(), top: true);
          imageFileList.remove(filepath);

          // Alert.showSnackBar(
          //     title: 'Uploaded', message: res["message"], top: true);
          // log(res["data"].toString());
          // imageFileList.remove();
        } else {
          Alert.showSnackBar(
              title: '', message: res["error"].toString(), top: false);
        }

        // await Future.delayed(Duration(seconds: 5));

        isUploading.value = false;
      } else {
        Alert.showSnackBar(
            title: 'Upload Fail', message: 'Response Error', top: false);
      }

      // _saveImage();
    } finally {
      isUploading.value = false;
    }
  }

  void pickImage(ImageSource source) async {
    try {
      final pickedImage = await _picker.pickImage(source: source, imageQuality: 100);

      if (pickedImage != null) {
        imageFileList.add(pickedImage);

      } else {
        Alert.showSnackBar(
            title: 'No Image', message: 'No Image Selected', top: true);
       }

      setProfilePicPath(pickedImage!.path);
    } catch (e) {
      print(e);
    }
    Get.back();
  }

  void setProfilePicPath(String path){
    profilePicPath.value = path ;
    isImagePathSet.value = true;
  }

  Future<bool> getHomeWorkToday() async {
    print(todayCurrentPage.value);

    // isloading.value = true;
    // isRefresh ? isloading.value = true : false;

    var response = await ApiServices()
        .getWithToken(ApiUrl.studentHomework(duration, todayCurrentPage.value));

    if (response != null) {
      var res = studentHomeWorkModelFromJson(response);

      print(res);

      if (res.success) {
        todayHomeworkList.addAll(res.data!.data);
        todayCurrentPage++;

        if (todayCurrentPage.value == res.data?.lastPage) {
          // lastpage.value = true;
          todayRefreshController.loadNoData();
        }
        if (todayCurrentPage.value > res.data!.lastPage) {
          todayLastpage.value = true;
          // refreshController.loadNoData();
        }

        // noticeList. = res.data.data;
        isloading.value = false;
        return true;
      } else {
        Alert.showSnackBar(title: 'Error', message: res.message, top: false);
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> getHomeWorkWeekly(
      {bool isRefresh = false, bool islLoading = false}) async {
    // isRefresh ? isloading.value = true : false;

    var response = await ApiServices().getWithToken(
        ApiUrl.studentHomework('weekly', weeklyCurrentPage.value));

    if (response != null) {
      var res = studentHomeWorkModelFromJson(response);

      print(res);

      if (res.success) {
        if (isRefresh) {
          // weeklyCurrentPage.value = 1;
          print('page');
          print(weeklyCurrentPage);
          weeklyHomeworkList.value = res.data!.data;
        } else if (islLoading) {
          weeklyHomeworkList.addAll(res.data!.data);
          weeklyCurrentPage++;
        } else {
          weeklyHomeworkList.addAll(res.data!.data);
        }

        if (weeklyCurrentPage.value == res.data?.lastPage) {
          // lastpage.value = true;
          weeklyRefreshController.loadNoData();
        }
        if (weeklyCurrentPage.value > res.data!.lastPage) {
          weeklyLastpage.value = true;
          // refreshController.loadNoData();
        }

        // noticeList. = res.data.data;
        isloading.value = false;
        return true;
      } else {
        Alert.showSnackBar(title: 'Error', message: res.message, top: false);
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> getHomeworkMontly({
    bool isRefresh = false,
  }) async {
    print(todayCurrentPage.value);

    // isRefresh ? isloading.value = true : false;

    var response = await ApiServices().getWithToken(
        ApiUrl.studentHomework('monthly', monthlyCurrentPage.value));

    if (response != null) {
      var res = studentHomeWorkModelFromJson(response);

      if (res.success) {
        if (isRefresh) {
          // weeklyCurrentPage.value = 1;
          print('page');
          print(monthlyCurrentPage);
          monthlyHomeworkList.value = res.data!.data;
          monthlyCurrentPage++;
        } else {
          // weeklyHomeworkList.value = res.data!.data;
          monthlyCurrentPage++;

          monthlyHomeworkList.addAll(res.data!.data);
        }

        if (monthlyCurrentPage.value == res.data?.lastPage) {
          // lastpage.value = true;
          monthlyRefreshController.loadNoData();
        }
        if (monthlyCurrentPage.value > res.data!.lastPage) {
          monthlyLastpage.value = true;
          // refreshController.loadNoData();
        }

        // noticeList. = res.data.data;
        isloading.value = false;
        return true;
      } else {
        Alert.showSnackBar(title: 'Error', message: res.message, top: false);
        return false;
      }
    } else {
      return false;
    }
  }

  void seeSubmitedHomework(context, id) async {
    try {
      var response = await ApiServices()
          .getWithToken(ApiUrl.studentSubmittedHomeworkView(id));

      if (response != null) {
        var res = submittedHomeworkModelFromJson(response);
        if (res.success) {
          submittedWorkList.value = res.data!.homeworkUploadDetails;
          // submittedWorkList.add(res.data!.homeworkUploadDetails);

          // Get.defaultDialog(
          //     title: 'Submitted Work',
          //     content: Container(
          //       width: 300,
          //       height: 400,
          //       child: submittedWorkList.isEmpty ? Center(child: Text("No work Submitted"),):
          //       ListView.builder(
          //         scrollDirection: Axis.horizontal,
          //         itemCount: submittedWorkList.length,
          //         itemBuilder: (context, index) {
          //           var myitem = submittedWorkList[index];
          //           return Image.network(
          //             myitem.file!,
          //             height: 200,
          //           );
          //         },
          //       ),
          //     ));
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return submittedWork(context, submittedWorkList);
              });

          // Get.defaultDialog(
          //     title: 'Submitted Work',
          //     content: Container(
          //       width: 300,
          //       height: 400,
          //       child: submittedWorkList.isEmpty
          //           ? Center(
          //               child: Text("No work Submitted"),
          //             )
          //           : ListView.builder(
          //               scrollDirection: Axis.horizontal,
          //               itemCount: submittedWorkList.length,
          //               itemBuilder: (context, index) {
          //                 var myitem = submittedWorkList[index];
          //                 return Image.network(
          //                   myitem.file!,
          //                   height: 200,
          //                 );
          //               },
          //             ),
          //     ));

        } else {
          Alert.showSnackBar(
              title: '', message: 'Something went wrong'.toString(), top: true);
        }

        // await Future.delayed(Duration(seconds: 5));

        // isUploading.value = false;
      } else {
        Alert.showSnackBar(
            title: 'Upload Fail', message: 'Response Error', top: false);
      }

      // _saveImage();
    } finally {
      // isUploading.value = false;
    }
  }
}
