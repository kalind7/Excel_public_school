import 'package:flutter/material.dart';
import 'package:new_project_work/widgets/simmer/main_shimmer.dart';

class CalenderDayShimmer extends StatelessWidget {
  const CalenderDayShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShimmerWidget.rectangular(
        height: 40,
        width: 40,
      ),
    );
  }
}
