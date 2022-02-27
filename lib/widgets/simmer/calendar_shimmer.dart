import 'package:flutter/material.dart';
import 'package:new_project_work/widgets/simmer/main_shimmer.dart';

class CalendarShimmer extends StatelessWidget {
  const CalendarShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) => ListTile(
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShimmerWidget.rectangular(
                    width: 50,
                    height: 50,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  ShimmerWidget.rectangular(
                    width: MediaQuery.of(context).size.width * 0.11,
                    height: 5,
                  ),
                ],
              ),
              const SizedBox(
                width: 7,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: ShimmerWidget.rectangular(
                  width: 4,
                  height: 40,
                ),
              ),
            ],
          ),
          title: Align(
            alignment: Alignment.centerLeft,
            child: ShimmerWidget.rectangular(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 16,
            ),
          ),
          subtitle: Align(
            alignment: Alignment.centerLeft,
            child: ShimmerWidget.rectangular(
              width: MediaQuery.of(context).size.width * 0.35,
              height: 16,
            ),
          ),
        ),
      ),
    );
  }
}
