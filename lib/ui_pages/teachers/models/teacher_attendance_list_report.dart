// To parse this JSON data, do
//
//     final teacherReport = teacherReportFromJson(jsonString);

import 'dart:convert';

TeacherReportList teacherReportFromJson(String str) => TeacherReportList.fromJson(json.decode(str));

String teacherReportToJson(TeacherReportList data) => json.encode(data.toJson());

class TeacherReportList {
  TeacherReportList({
    required this.success,
    required this.data,
    this.message,
  });

  bool success;
  Data data;
  dynamic message;

  factory TeacherReportList.fromJson(Map<String, dynamic> json) => TeacherReportList(
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
    required this.classes,
    required this.attendances,
    this.days,
    required this.year,
    required this.month,
  });

  List<Class> classes;
  List<Attendance> attendances;
  dynamic days;
  String year;
  String month;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    classes: List<Class>.from(json["classes"].map((x) => Class.fromJson(x))),
    attendances: List<Attendance>.from(json["attendances"].map((x) => Attendance.fromJson(x))),
    days: json["days"],
    year: json["year"],
    month: json["month"],
  );

  Map<String, dynamic> toJson() => {
    "classes": List<dynamic>.from(classes.map((x) => x.toJson())),
    "attendances": List<dynamic>.from(attendances.map((x) => x.toJson())),
    "days": days,
    "year": year,
    "month": month,
  };
}

class Attendance {
  Attendance({
    required this.id,
    required this.studentName,
    required this.present,
    required this.absent,
    required this.leave,
    required this.half,
    required this.full,
    required this.percentage,
  });

  int id;
  String studentName;
  int present;
  int absent;
  int leave;
  int half;
  int full;
  String percentage;

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
    id: json["id"],
    studentName: json["student_name"],
    present: json["present"],
    absent: json["absent"],
    leave: json["leave"],
    half: json["half"],
    full: json["full"],
    percentage: json["percentage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student_name": studentName,
    "present": present,
    "absent": absent,
    "leave": leave,
    "half": half,
    "full": full,
    "percentage": percentage,
  };
}

class Class {
  Class({
    required this.id,
    required this.className,
    required this.activeStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.schoolId,
  });

  int id;
  String className;
  int activeStatus;
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;
  int updatedBy;
  int schoolId;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    id: json["id"],
    className: json["class_name"],
    activeStatus: json["active_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    schoolId: json["school_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "class_name": className,
    "active_status": activeStatus,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "created_by": createdBy,
    "updated_by": updatedBy,
    "school_id": schoolId,
  };
}
