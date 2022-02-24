import 'package:get/get.dart';
import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/event_model.dart';
import 'package:new_project_work/utils.dart';

class TableEventController extends GetxController {

  List selectedEvents = <Datum>[].obs;
  var eventList = [].obs;
  var isloading = true.obs;
  var lastpage = false.obs;
  var currentPage = 1.obs;
  var isMoreDataAvailable = false.obs;

  var event = <Datum>[].obs;

  @override
  void onInit() {
    getEvent();
    // paginateTask();
    super.onInit();
  }

  List<Datum> getEventsForDay(DateTime day) {
    // Implementation example
    // return kEvents[day] ?? [];
    return event
        .where((element) => element.fromDate.isAtSameMomentAs(day))
        .toList();
  }

  List<Datum> getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ...getEventsForDay(d),
    ];
  }


  Future getEvent() async {
    var response = await ApiServices().get('event');

    var res = eventModelFromJson(response);

    if (res.success) {
      // event = res.data;


      // final eventsConvert =
      //     event.map((fromDate) => (DateTime.parse(date))).toList();
event.value = res.data;
      // event.assignAll(res.data);

      print(event);
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
