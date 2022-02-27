// To parse this JSON data, do
//
//     final StudentFeeDetailPaymentModel = studentFeeDetailModelFromJson(jsonString);

import 'dart:convert';

StudentFeeDetailPaymentModel StudentFeeDetailPaymentModelFromJson(String str) =>
    StudentFeeDetailPaymentModel.fromJson(json.decode(str));

String StudentFeeDetailPaymentModelToJson(StudentFeeDetailPaymentModel data) =>
    json.encode(data.toJson());

class StudentFeeDetailPaymentModel {
  StudentFeeDetailPaymentModel({
    required this.success,
    this.data,
    this.message,
  });

  bool success;
  FeePaymentData? data;
  dynamic message;

  factory StudentFeeDetailPaymentModel.fromJson(Map<String, dynamic> json) =>
      StudentFeeDetailPaymentModel(
        success: json["success"],
        data: FeePaymentData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };
}

class FeePaymentData {
  FeePaymentData({
    required this.preAmount,
    required this.amountPaid,
     this.balanceDue,
  });

  int preAmount;
  int amountPaid;
  int? balanceDue;

  factory FeePaymentData.fromJson(Map<String, dynamic> json) => FeePaymentData(
        preAmount: json["Pre Amount"],
        amountPaid: json["Amount Paid"],
        balanceDue: json["Balance Due"],
      );

  Map<String, dynamic> toJson() => {
        "Pre Amount": preAmount,
        "Amount Paid": amountPaid,
        "Balance Due": balanceDue,
      };
}
