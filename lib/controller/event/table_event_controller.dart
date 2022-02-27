import 'package:get/get.dart';
import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/event_model.dart';
import 'package:new_project_work/utils/constant.dart';

class TableEventController extends GetxController {
  var eventList = [].obs;
  var isloading = true.obs;
  var lastpage = false.obs;
  var currentPage = 1.obs;
  var isMoreDataAvailable = false.obs;

  var event = <Datum>[].obs;
  var eventNepali = <Datum>[].obs;

  var year = kToday.year;
  var month = kToday.month;

  @override
  void onInit() {
    getEvent(year, month);
    getEventNepali(year, month);
    // paginateTask();
    super.onInit();
  }

  Future getEventNepali(year, month) async {
    isloading.value = true;
    var response = await ApiServices().get(ApiUrl.eventList(year, month));

    var res = eventModelFromJson(response);

    if (res.success) {
      eventNepali.value = res.data;
      isloading.value = false;

      print('Data');

      // final eventsConvert =
      //     event.map((fromDate) => (DateTime.parse(date))).toList();

      // eventList.assignAll(event);

      // print(eventList);
      // print(res.toString());
    } else {
      print('data failed');
    }
  }

  Future getEvent(year, month) async {
    isloading.value = true;
    var response = await ApiServices().get(ApiUrl.eventList(year, month));

    var res = eventModelFromJson(response);

    if (res.success) {
      event.value = res.data;
      isloading.value = false;

      print('Data');

      // final eventsConvert =
      //     event.map((fromDate) => (DateTime.parse(date))).toList();

      // eventList.assignAll(event);

      // print(eventList);
      // print(res.toString());
    } else {
      print('data failed');
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
