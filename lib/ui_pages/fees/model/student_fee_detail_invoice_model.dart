// To parse this JSON data, do
//
//     final studentFeeDetailInvoiceModel = studentFeeDetailInvoiceModelFromJson(jsonString);

import 'dart:convert';

StudentFeeDetailInvoiceModel studentFeeDetailInvoiceModelFromJson(String str) =>
    StudentFeeDetailInvoiceModel.fromJson(json.decode(str));

String studentFeeDetailInvoiceModelToJson(StudentFeeDetailInvoiceModel data) =>
    json.encode(data.toJson());

class StudentFeeDetailInvoiceModel {
  StudentFeeDetailInvoiceModel({
    required this.success,
    required this.data,
    this.message,
  });

  bool success;
  FeeInvoiceData data;
  dynamic message;

  factory StudentFeeDetailInvoiceModel.fromJson(Map<String, dynamic> json) =>
      StudentFeeDetailInvoiceModel(
        success: json["success"],
        data: FeeInvoiceData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class FeeInvoiceData {
  FeeInvoiceData({
    required this.fees,
  });

  Fees fees;

  factory FeeInvoiceData.fromJson(Map<String, dynamic> json) => FeeInvoiceData(
        fees: Fees.fromJson(json["fees"]),
      );

  Map<String, dynamic> toJson() => {
        "fees": fees.toJson(),
      };
}

class Fees {
  Fees({
    required this.timeline,
    required this.total,
    required this.grandtotal,
  });

  List<Timeline> timeline;
  int total;
  int grandtotal;

  factory Fees.fromJson(Map<String, dynamic> json) => Fees(
        timeline: List<Timeline>.from(
            json["timeline"].map((x) => Timeline.fromJson(x))),
        total: json["total"],
        grandtotal: json["grandtotal"],
      );

  Map<String, dynamic> toJson() => {
        "timeline": List<dynamic>.from(timeline.map((x) => x.toJson())),
        "total": total,
        "grandtotal": grandtotal,
      };
}

class Timeline {
  Timeline({
    required this.monthly,
     this.exam,
  });

  int? monthly;
  int? exam;

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        monthly: json["Monthly"] == null ? null : json["Monthly"],
        exam: json["Exam"] == null ? null : json["Exam"],
      );

  Map<String, dynamic> toJson() => {
        "Monthly": monthly,
        "Exam": exam,
      };
}
