import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/models/routine_list.dart';

class StudentHomeController extends GetxController {
  var routineList = <RoutineDetails>[].obs;
  var id = 0.obs;
  var name = "loading".obs;
  var section = "loading".obs;
  var className = "".obs;
  var email = "loading".obs;
  var admissionNumber = "loading".obs;


  @override
  void onInit() {
    getDetails();
    super.onInit();
  }

  void getDetails() async {
    await Hive.openBox(Constants.APPNAME);
    var box = Hive.box(Constants.APPNAME);
    id.value = box.get(Constants.userId);
    name.value = box.get(Constants.name);
    className.value = box.get(Constants.className);
    section.value = box.get(Constants.sectionName);
    email.value = box.get(Constants.email);
    admissionNumber.value = box.get(Constants.admissionNumber).toString();
  }



    // final XFile images = await _picker.pickImage(source: source)
   

    // if (image != null) {
    //   file = File(image.path);
    //   uploadImage();
    //   setState(() {});
    // }

}
