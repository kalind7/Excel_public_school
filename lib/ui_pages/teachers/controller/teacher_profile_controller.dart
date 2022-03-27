import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:new_project_work/api/api_url.dart';

class TeacherProfileController extends GetxController{

  // var id = 0.obs;
  var name = "loading".obs;
  var email = "loading".obs;
  var currentAddress = "loading".obs;
  var dateOfBirth = "loading".obs ;
  var dateOfJoining = "loading".obs;
  var qualification = "loading".obs;
  var experience = "loading".obs;
  var mobile = "".obs;


  @override
  void onInit() {
    fetchDetails();
    super.onInit();
  }

  void fetchDetails()async{
    await Hive.openBox(Constants.APPNAME);
    var box = Hive.box(Constants.APPNAME);
    name.value = box.get(Constants.name);
    email.value = box.get(Constants.email);
    experience.value = box.get(Constants.experience);
    qualification.value = box.get(Constants.qualification);
    dateOfBirth = box.get(Constants.dateOfBirth);
    dateOfJoining.value = box.get(Constants.dateOfJoining);
    currentAddress.value = box.get(Constants.currentAddress);
    mobile.value = box.get(Constants.mobile);

  }
}