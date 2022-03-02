import 'package:flutter/material.dart';

class FeesShimmer extends StatelessWidget {
  const FeesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(horizontal: 7.0),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width / 4,
              child: Row(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.125,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.grey.shade200,
                      ),
                      child: Center(
                        child: Container(
                          height: 10,
                          width: 50,
                          color: Colors.black12,
                        ),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.125,
                    width: MediaQuery.of(context).size.width / 1.37,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.grey.shade200,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                              width: 50,
                              color: Colors.black12,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              height: 5,
                              width: 25,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                              width: 40,
                              color: Colors.black12,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              height: 7,
                              width: 60,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
