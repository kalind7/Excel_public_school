// To parse this JSON data, do
//
//     final studentAttendanceModel = studentAttendanceModelFromJson(jsonString);

import 'dart:convert';

import 'package:nepali_date_picker/nepali_date_picker.dart';

StudentAttendanceModel studentAttendanceModelFromJson(String str) => StudentAttendanceModel.fromJson(json.decode(str));

String studentAttendanceModelToJson(StudentAttendanceModel data) => json.encode(data.toJson());

class StudentAttendanceModel {
    StudentAttendanceModel({
        required this.success,
         required this.data,
        this.message,
    });

    bool success;
    Data data;
    dynamic message;

    factory StudentAttendanceModel.fromJson(Map<String, dynamic> json) => StudentAttendanceModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    Data({
        required this.attendances,
        required this.details,
        required this.status,
    });

    List<Attendance> attendances;
    Details details;
    String status;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        attendances: List<Attendance>.from(json["attendances"].map((x) => Attendance.fromJson(x))),
        details: Details.fromJson(json["details"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "attendances": List<dynamic>.from(attendances.map((x) => x.toJson())),
        "details": details.toJson(),
        "status": status,
    };
}

class Attendance {
    Attendance({
        required this.id,
        required this.attendanceType,
        required this.attendanceDate,
        this.notes,
    });

    int id;
    String attendanceType;
    NepaliDateTime attendanceDate;
    dynamic notes;

    factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        id: json["id"],
        attendanceType: json["attendance_type"],
        attendanceDate: NepaliDateTime.parse(json["attendance_date"]),
        notes: json["notes"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attendance_type": attendanceType,
        "attendance_date": "${attendanceDate.year.toString().padLeft(4, '0')}-${attendanceDate.month.toString().padLeft(2, '0')}-${attendanceDate.day.toString().padLeft(2, '0')}",
        "notes": notes,
    };
}

class Details {
  late int p;
  late int l;
  late int a;
  late int h;
  late int f;

  Details(
      {required this.p,
      required this.l,
      required this.a,
      required this.h,
      required this.f});

  Details.fromJson(Map<String, dynamic> json) {
    p = json['P'];
    l = json['L'];
    a = json['A'];
    h = json['H'];
    f = json['F'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['P'] = this.p;
    data['L'] = this.l;
    data['A'] = this.a;
    data['H'] = this.h;
    data['F'] = this.f;
    return data;
  }
}




