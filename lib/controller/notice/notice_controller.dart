import 'package:get/get.dart';

import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/global/alert.dart';
import 'package:new_project_work/models/notice/notice_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NoticeController extends GetxController {
  List noticeList = <Datum>[].obs;
  var isloading = true.obs;
  var lastpage = false.obs;
  var currentPage = 1.obs;
  var isMoreDataAvailable = false.obs;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void onInit() {
    getNotice();
    // paginateTask();
    super.onInit();
  }

  Future<bool> getNotice({bool isRefresh = false}) async {
    print(currentPage.value);

    // isloading.value = true;
    // isRefresh ? isloading.value = true : false;

    var response = await ApiServices()
        .get(ApiUrl.noticelistCurrentIndex(currentPage.value));

    var res = noticeModelFromJson(response);

    if (res.success) {
      // if (isRefresh) {
      //   noticeList.addAll(res.data.data);
      // } else {
      noticeList.addAll(res.data.data);
      currentPage++;
      // }

      // noticeList.addAll(res.data.data);

      if (currentPage.value == res.data.lastPage) {
        // lastpage.value = true;
        refreshController.loadNoData();
      }
      if (currentPage.value > res.data.lastPage) {
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
  }

}
