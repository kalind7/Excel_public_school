import 'package:get/get.dart';
import 'package:new_project_work/models/gird_view_list.dart';

// import 'package:new_project_work/ui_pages/dashboard.dart';
// import 'package:new_project_work/ui_pages/dashboard.dart';

class GridController extends GetxController {
  var girdList = <Model>[].obs;

  @override
  void onInit() {
    fetchDetails();
    super.onInit();
  }

  fetchDetails() async {
    await Future.delayed(Duration(seconds: 1));

    // var newList2 = [
    //   Model(
    //     text: 'Profile',
    //     icon: Icons.person,
    //   ),
    // Model(
    //     text: 'Fees',
    //     icon: Icons.event_note_rounded,
    //     ),
    // Model(
    //     text: 'Result',
    //     icon: Icons.file_copy_sharp,
    //    ),
    // Model(
    //     text: 'Attendance',
    //     icon: Icons.home_work_outlined,
    //     ),
    // Model(
    //     text: 'Subjects',
    //     icon: Icons.subject,
    //    ),
    // Model(
    //     text: 'Downloads',
    //     icon: Icons.download_rounded,
    //   ),
    // Model(
    //     text: 'Routine',
    //     icon: Icons.request_page_outlined,
    //    ),
    // Model(
    //     text: 'Library',
    //     icon: Icons.library_books_sharp,
    //   ),
    // Model(
    //     text: 'Teachers',
    //     icon: Icons.people,
    //    ),
    // Model(
    //     text: 'Exam',
    //     icon: Icons.wallpaper,
    //    ),
    // Model(
    //     text: 'Dormitory',
    //     icon: Icons.hotel,
    //   ),
    // Model(
    //     text: 'Transport',
    //     icon: Icons.bus_alert,
    //     ),
    // ];
    //
    //  girdList.value = newList2 ;
  }
}
