

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  final Widget ? child;

  const ShimmerWidget.rectangular(
      {Key? key,
      this.width = double.infinity,
      required this.height,
        this.child ,
      this.shapeBorder = const RoundedRectangleBorder()})

      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(seconds: 3),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: ShapeDecoration(
          shape: shapeBorder,
          color: Colors.grey.shade200,
        ),

      ),
    );
  }
}