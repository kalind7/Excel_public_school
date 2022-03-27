import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_project_work/global/alert.dart';

class TeacherImageController extends GetxController{

  final ImagePicker _picker = ImagePicker();
  var imageFileList = <XFile>[].obs;
  var isImagePathSet = false.obs;
  var profilePicPath = "".obs;


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


}