
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
      Alert.showSnackBar(res.message, false);
      return false;
    }
  }

  // ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  // disposeController() {
  //   scrollController.dispose();
  // }

  // initializeCOntroller() {
  //   scrollController = ScrollController(initialScrollOffset: 0);
  // }

  // paginateTask() {
  //   scrollController.addListener(() {
  //     double maxScroll = scrollController.position.maxScrollExtent;
  //     double currentScroll = scrollController.position.pixels;

  //     if (currentScroll == maxScroll) {
  //       currentPage++;
  //       getNotice();
  //     }
  //   });
  // }

  // Future getNotice(currentPage) async {
  //   isloading.value = true;

  //   var response =
  //       await ApiServices().get(ApiUrl.noticelistCurrentIndex(currentPage));

  //   var res = noticeModelFromJson(response);

  //   if (res.success) {
  //     if (res.data.data.length > 0) {
  //       noticeList.addAll(res.data.data);
  //       isMoreDataAvailable.value = true;
  //     } else {
  //       isMoreDataAvailable.value = false;
  //       Get.snackbar("Message", "No more items");
  //     }

  //     // currentPage++;
  //     // if (currentPage >= res.data.lastPage) {
  //     //   refreshController.loadNoData();
  //     // }

  //     // noticeList. = res.data.data;
  //     isloading.value = false;
  //   } else {
  //     Alert.showSnackBar(res.message);
  //   }
  // }
}
