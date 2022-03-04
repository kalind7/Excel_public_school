import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController{


  var isLoading = true.obs;
   XFile ? pickedFile;
  final ImagePicker _imagePicker = ImagePicker();


  void takePhoto(ImageSource source) async{

    final pickedImage = await _imagePicker.pickImage(source: source,imageQuality: 100);
    pickedFile = pickedImage ;
    print(pickedFile!.path);
  }

  @override
  void onInit() {
    fetchDetails();
    super.onInit();
  }

  void fetchDetails() async{
    isLoading.value = true ;
    await Future.delayed(Duration(seconds: 3));
    isLoading.value = false;
  }
}