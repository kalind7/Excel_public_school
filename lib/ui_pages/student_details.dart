import 'package:excel_public_school/models/student_model.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:excel_public_school/widgets/appbar.dart';
import 'package:excel_public_school/widgets/category_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<StudentModel> newModel = model1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: const CategoryDrawer(),
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55.0),
          child: WidgetAppbar(
            title: '',
            onPress: () => _scaffoldKey.currentState!.openDrawer(),
            icon: 'files/icons/four_bar_menu.svg',
          ),
        ),
        body: Stack(
          // clipBehavior: Clip.hardEdge,
          // overflow: Overflow.clip,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 175.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18)),
                    gradient: LinearGradient(
                        colors: [pinkOne, orangeOne],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      VerticalDivider(
                        width: 3,
                        thickness: 5,
                        color: orangeOne,
                      ),
                      VerticalDivider(
                        width: 3,
                        thickness: 5,
                        color: orangeOne,
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    height: MediaQuery.of(context).size.height / 2.75,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.vertical(
                            top: const Radius.circular(10),
                            bottom: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: orangeOne,
                            blurRadius: 4,
                            blurStyle: BlurStyle.inner,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 20, left: 50),
                        shrinkWrap: true,
                        itemCount: newModel.length,
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${newModel[index].title}  ',
                                style: titleStyle,
                              ),
                              Text(
                                ':',
                                style: answerStyle,
                              ),
                              const SizedBox(
                                width: 50.0,
                                height: 50,
                              ),
                              Text(
                                '${newModel[index].answer} ',
                                style: answerStyle,
                              ),
                            ],
                          );
                        })),
              ],
            ),
            Positioned(
              left: 10,
              right: 10,
              top: 140,
              // alignment: Alignment.center,
              child: Card(
                shadowColor: orangeOne,
                clipBehavior: Clip.antiAlias,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1, color: orangeOne)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 60,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                    child: Text(
                      "Dhiraj Shrestha",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: orangeOne,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 55,
              // alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [pinkOne, orangeOne],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter),
                  shape: BoxShape.circle,
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50.0,
                  child: Image(
                    height: 75,
                    width: 75,
                    image: AssetImage('files/images/excellogo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
