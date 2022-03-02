import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/global/alert.dart';

import 'package:new_project_work/ui_pages/student/homework/model/student_homrwork_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StudentHomeworkController extends GetxController {
  var homeworkList = <StudentHomeWorkData>[].obs;
  var currentPage = 1.obs;
  final ImagePicker _picker = ImagePicker();
  late XFile? _imageFile;

  var isloading = true.obs;
  var duration = "";
  var lastpage = false.obs;

  var isMoreDataAvailable = false.obs;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void onInit() {
    getHomeWork();
    // paginateTask();
    super.onInit();
  }

  void pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      _imageFile = pickedFile;
      // _saveImage();
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
}
