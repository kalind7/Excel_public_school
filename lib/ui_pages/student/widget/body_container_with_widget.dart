import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';

class BodyWithWidgetContainer extends StatelessWidget {
  final Widget bodyWidget;
  final Widget upperWidget;
  final double top;

  const BodyWithWidgetContainer(
      {Key? key, required this.bodyWidget, required this.upperWidget, required this.top})
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
            Expanded(child: bodyWidget),
          ],
        ),
        Positioned(
          left: 10,
          right: 10,
          top: top,
          child: upperWidget,
        ),
      ],
    );
  }
}
