import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/fees/model/student_fee_detail_payment_model.dart';
import 'package:new_project_work/ui_pages/fees/views/widget_listTile.dart';
import 'package:new_project_work/utils/color.dart';

Widget feesPopup(BuildContext context, FeePaymentData? data, month) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Dialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      height: height * 0.5,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: orangeOne,
              // spreadRadius: 5,
              blurRadius: 4,
              blurStyle: BlurStyle.inner,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 2.0),
            padding: EdgeInsets.symmetric(horizontal: 7),
            height: height * 0.09,
            decoration: BoxDecoration(
              color: pink,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Invoice of $month',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                  ),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                )),
            child: Column(
              children: [
                listDetails(title: 'Fee Description', answer: 'Amount'),
                listDetails(
                    title: 'Monthly', answer: 'Rs. ${data!.preAmount}'),
                listDetails(
                    title: 'Exam', answer: 'Rs. ${data.amountPaid}'),
                data.balanceDue == null
                    ? SizedBox()
                    : listDetails(
                    title: 'Balance Due', answer: 'Rs. ${data.balanceDue}'),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
