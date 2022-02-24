import 'package:get/get.dart';
import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/event_model.dart';
import 'package:new_project_work/global/alert.dart';

class TableEventController extends GetxController {
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

  Future getEvent() async {
    isloading.value = true;
    var response = await ApiServices().get('event');

    var res = eventModelFromJson(response);

    if (res.success) {
      event.value = res.data;
      isloading.value = false;
    } else {
      Alert.showSnackBar('Something went wrong', false);
    }
  }
}
