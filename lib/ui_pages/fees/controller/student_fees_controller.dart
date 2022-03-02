import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/ui_pages/fees/model/student_fee_detail_invoice_model.dart';
import 'package:new_project_work/ui_pages/fees/model/student_fee_detail_payment_model.dart';
import 'package:new_project_work/ui_pages/fees/model/student_fee_model.dart'
    as feemodel;
import 'package:new_project_work/ui_pages/fees/views/fee_payment_pop_up.dart';
import 'package:new_project_work/ui_pages/fees/views/invoice_payment_popup.dart';
import 'package:new_project_work/ui_pages/student/homepage/controller/student_home_controller.dart';

class FeeController extends GetxController {
  final studentHomeController = Get.find<StudentHomeController>();
  var feeList = <feemodel.Timeline?>[].obs;

  var isLoading = true.obs;
  var isFeeDetailLoading = false.obs;
  var netPayable = 0.obs;
  var credit = 0.obs;
  int studentId = 0;

  @override
  void onInit() {
    fetchDetails(studentHomeController.id.toInt());
    super.onInit();
  }

  void fetchDetails(studentid) async {
    isLoading.value = true;
    var response = await ApiServices().get(ApiUrl.studentFees(studentid));

    var res = feemodel.studentFeeModelFromJson(response);
    if (res.success) {
      netPayable.value = res.data!.details.netpayable;
      credit.value = res.data!.details.openingbalance.cr;
      feeList.value = res.data!.timeline!;
      isLoading.value = false;
    }
  }

  void fetchFeeDetails(context, studentid, feeid, type, month) async {
    print('first value');
    isFeeDetailLoading.value = true;
    print(isFeeDetailLoading.value);
    var response = await ApiServices()
        .get(ApiUrl.studentFeesDetail(studentid, feeid, type));

    log(response.toString());

    if (type == "invoice") {
      var res = studentFeeDetailInvoiceModelFromJson(response);

      if (res.success) {
        isFeeDetailLoading.value = false;
        print('data from invoice');
        print(isFeeDetailLoading.value);
        showDialog(
            context: context,
            builder: (context) {
              return feesInvoicePopup(context, res.data, month);
            });

        // Get.defaultDialog(title: 'Fee for $month');
        // feesPopup();
      }
    } else {
      var res = StudentFeeDetailPaymentModelFromJson(response);
      if (res.success) {
        isFeeDetailLoading.value = false;

        print('data from payment');
        print(isFeeDetailLoading.value);
        showDialog(
            context: context,
            builder: (context) {
              return feesPopup(context, res.data, month);
            });

        // return res.data;
      }
    }
  }
}
