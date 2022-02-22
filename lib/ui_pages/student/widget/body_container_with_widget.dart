import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';

class BodyWithWidgetContainer extends StatelessWidget {
  final Widget bodyWidget;
  final Widget uppderWidget;

  const BodyWithWidgetContainer(
      {Key? key, required this.bodyWidget, required this.uppderWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // clipBehavior: Clip.hardEdge,
      // overflow: Overflow.clip,
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
          left: 20,
          right: 20,
          top: 35,
          child: uppderWidget,
        ),
      ],
    );
  }
}
