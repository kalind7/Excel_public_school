import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/homework/controller/image_controller.dart';
import 'package:new_project_work/ui_pages/student/homework/widget/student_homework_container.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/simmer/homework_shimmer.dart';

class StudentHomework extends StatefulWidget {
  StudentHomework({Key? key}) : super(key: key);

  @override
  _StudentHomeworkState createState() => _StudentHomeworkState();
}

class _StudentHomeworkState extends State<StudentHomework>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        key: _scaffoldKey,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(55.0),
            child: WidgetAppbar(
                  icon: Icons.refresh,
                  title: 'Homework',
                  onPress: (){
                    imageController.fetchDetails();
                  },
                ),

        ),
        body: BodyWithWidgetContainer(
          top: 100,
          upperWidget:ButtonsTabBar(
              controller: tabController,
              backgroundColor: pink,
              unselectedBackgroundColor: Colors.grey[300],
              radius: 5,
              tabs: const [
                Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'Today',
                        style: tabTitle,
                      ),
                    )),
                Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'Weekly',
                        style: tabTitle,
                      ),
                    )),
                Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text('Monthly', style: tabTitle),
                    )),
              ]),

          bodyWidget: TabBarView(
              controller: tabController,
              children: [
            Obx(
              () => imageController.isLoading.value
                  ? HomeworkShimmer()
                  : HomeworkContainer(),
            ),
            Center(
              child: Text('Weekly View'),
            ),
            Center(
              child: Text('Monthly View'),
            ),
          ]),
        ));
  }
}
