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
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StudentHomeworkController extends GetxController {
  var homeworkList = <StudentHomeWorkData>[].obs;
  var currentPage = 1.obs;
  final ImagePicker _picker = ImagePicker();
  var imageFileList = <XFile>[].obs;
  var submittedWorkList = <HomeworkUploadDetail>[].obs;
  // XFile? imageFile = null.obs as XFile?;
  var isImagePathSet = false.obs;

  var isloading = true.obs;
  var isUploading = false.obs;
  var duration = "monthly";
  var lastpage = false.obs;
  var isMoreDataAvailable = false.obs;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  var progress = 0.obs;
  final ReceivePort receivePort = ReceivePort();

  @override
  void onInit() {
    getHomeWork();
    fetchDetails();

    IsolateNameServer.registerPortWithName(receivePort.sendPort, "downloadPdf");
    receivePort.listen((message) {
      progress = message[2];
      print(message);
    });
    FlutterDownloader.registerCallback(downloadCallback);
    super.onInit();
  }

 static downloadCallback(id, status, progress){
    SendPort? sendPort = IsolateNameServer.lookupPortByName("downloadPdf");
    sendPort!.send([id,status, progress]);
  }

  void downloadFile(String file) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
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
      print('not granted');
    }
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
      final pickedImage =
          await _picker.pickImage(source: source, imageQuality: 100);

      if (pickedImage != null) {
        imageFileList.add(pickedImage);
      } else {
        Alert.showSnackBar(
            title: 'No Image', message: 'No Image Selected', top: true);
      }

      // imageFile = pickedImage;
      // print(imageFile!.path);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> getHomeWork() async {
    print(currentPage.value);

    // isloading.value = true;
    // isRefresh ? isloading.value = true : false;

    var response = await ApiServices()
        .getWithToken(ApiUrl.studentHomework(duration, currentPage.value));

    if (response != null) {
      var res = studentHomeWorkModelFromJson(response);

      print(res);

      if (res.success) {
        homeworkList.addAll(res.data!.data);
        currentPage++;

        if (currentPage.value == res.data?.lastPage) {
          // lastpage.value = true;
          refreshController.loadNoData();
        }
        if (currentPage.value > res.data!.lastPage) {
          lastpage.value = true;
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

          Get.defaultDialog(
              title: 'Submitted Work',
              content: Container(
                width: 300,
                height: 400,
                child: submittedWorkList.isEmpty ? Center(child: Text("No work Submitted"),):
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: submittedWorkList.length,
                  itemBuilder: (context, index) {
                    var myitem = submittedWorkList[index];
                    return Image.network(
                      myitem.file!,
                      height: 200,
                    );
                  },
                ),
              ));

        } else {
          Alert.showSnackBar(
              title: '', message: 'Something went wrong'.toString(), top: true);
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
}
