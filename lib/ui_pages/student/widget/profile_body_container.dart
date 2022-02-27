import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';

class ProfileBodyContainer extends StatelessWidget {
  final Widget widget;
  final String text;
  final String? image;
  const ProfileBodyContainer(
      {Key? key, required this.widget, required this.text, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 155.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18)),
                gradient: LinearGradient(
                    colors: [pink, orangeOne],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter),
              ),
            ),
            widget,
          ],
        ),
        Positioned(
          left: 10,
          right: 10,
          top: 120,
          // alignment: Alignment.center,
          child: Card(
            shadowColor: pink,
            clipBehavior: Clip.antiAlias,
            elevation: 15.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(width: 1, color: pink)),
            child: Container(
              width: MediaQuery.of(context).size.width - 80,
              height: 60,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 20.0, color: pink, fontWeight: FontWeight.bold),
                ),
              )),
            ),
          ),
        ),
        image != null
            ? Positioned(
                left: 20,
                right: 20,
                top: 35,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [pink, orangeOne],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 55.0,
                    child: Image(
                      image: AssetImage(image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            : SizedBox(),
        SizedBox(
          height: 100.0,
        ),
      ],
    );
  }
}
