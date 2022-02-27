// To parse this JSON data, do
//
//     final studentFeeModel = studentFeeModelFromJson(jsonString);

import 'dart:convert';

StudentFeeModel studentFeeModelFromJson(String str) =>
    StudentFeeModel.fromJson(json.decode(str));

String studentFeeModelToJson(StudentFeeModel data) =>
    json.encode(data.toJson());

class StudentFeeModel {
  StudentFeeModel({
    required this.success,
    this.data,
    this.message,
  });

  bool success;
  Data? data;
  dynamic message;

  factory StudentFeeModel.fromJson(Map<String, dynamic> json) =>
      StudentFeeModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.details,
    this.timeline,
  });

  Details details;
  List<Timeline>? timeline;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        details: Details.fromJson(json["details"]),
        timeline: json["timeline"] != null
            ? List<Timeline>.from(
                json["timeline"].map((x) => Timeline.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "details": details.toJson(),
        "timeline": List<dynamic>.from(timeline!.map((x) => x.toJson())),
      };
}

class Details {
  Details({
    required this.netpayable,
    required this.openingbalance,
  });

  int netpayable;
  Openingbalance openingbalance;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        netpayable: json["netpayable"],
        openingbalance: Openingbalance.fromJson(json["openingbalance"]),
      );

  Map<String, dynamic> toJson() => {
        "netpayable": netpayable,
        "openingbalance": openingbalance.toJson(),
      };
}

class Openingbalance {
  Openingbalance({
    required this.dr,
    required this.cr,
  });

  int dr;
  int cr;

  factory Openingbalance.fromJson(Map<String, dynamic> json) => Openingbalance(
        dr: json["dr"],
        cr: json["cr"],
      );

  Map<String, dynamic> toJson() => {
        "dr": dr,
        "cr": cr,
      };
}

class Timeline {
  Timeline({
    required this.id,
    required this.type,
    this.billingDate,
    this.paymentDate,
    required this.amount,
    required this.credit,
    this.debit,
    required this.month,
  });

  int id;
  String type;
  dynamic billingDate;
  dynamic paymentDate;
  dynamic amount;
  int credit;
  dynamic debit;
  String month;

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        id: json["id"],
        type: json["type"],
        billingDate: json["billing_date"] == null
            ? null
            : DateTime.parse(json["billing_date"]),
        paymentDate: json["payment_date"] == null
            ? null
            : DateTime.parse(json["payment_date"]),
        amount: json["amount"],
        credit: json["credit"],
        debit: json["debit"],
        month: json["month"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "billing_date": billingDate == null
            ? null
            : "${billingDate?.year.toString().padLeft(4, '0')}-${billingDate?.month.toString().padLeft(2, '0')}-${billingDate?.day.toString().padLeft(2, '0')}",
        "payment_date": paymentDate == null
            ? null
            : "${paymentDate?.year.toString().padLeft(4, '0')}-${paymentDate?.month.toString().padLeft(2, '0')}-${paymentDate?.day.toString().padLeft(2, '0')}",
        "amount": amount,
        "credit": credit,
        "debit": debit,
        "month": month,
      };
}



