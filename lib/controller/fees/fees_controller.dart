import 'package:get/get.dart';

class FeeModel {
  final String month;
  final String invoice;
  final String date;
  final String amount1;
  final String amount2;
  final String details;
  final bool status;

  FeeModel(
      {required this.status,
      required this.month,
      required this.invoice,
      required this.date,
      required this.amount1,
        required this.amount2,
      required this.details});
}


class FeeController extends GetxController {
  var feeList = <FeeModel>[].obs;

  var isLoading = true.obs;

  List<FeeModel> list = [
    FeeModel(
      status: true,
      month: 'Baisakh',
      invoice: 'Invoice',
      date: 'Date',
      amount1: 'Paid',
      amount2: 'Rs .2200',
      details: 'Button',
    ),
    FeeModel(
      status: false,
      month: 'Baisakh',
      invoice: 'Invoice',
      date: 'Date',
      amount1: 'Paid',
      amount2: 'Rs.3300',
      details: 'Button',
    ),
    FeeModel(
      status: true,
      month: 'Baisakh',
      invoice: 'Invoice',
      date: 'Date',
      amount1: 'Paid',
      amount2: 'Rs. 2200',
      details: 'Show Details',
    )
  ];

  @override
  void onInit() {
    fetchDetails();
    super.onInit();
  }

  void fetchDetails() async {
    isLoading.value = true;
   await Future.delayed(Duration(seconds: 3));

  feeList.value = list;
  isLoading.value = false;

  }
}
