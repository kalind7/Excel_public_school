// // To parse this JSON data, do
// //
// //     final noticeModel = noticeModelFromJson(jsonString);

// import 'dart:convert';

// NoticeModel noticeModelFromJson(String str) =>
//     NoticeModel.fromJson(json.decode(str));

// String noticeModelToJson(NoticeModel data) => json.encode(data.toJson());

// class NoticeModel {
//   NoticeModel({
//     required this.success,
//     required this.data,
//     this.message,
//   });

//   bool success;
//   List<Datum> data;
//   dynamic message;

//   factory NoticeModel.fromJson(Map<String, dynamic> json) => NoticeModel(
//         success: json["success"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "message": message,
//       };
// }

// class Datum {
//   Datum({
//     required this.id,
//     required this.noticeTitle,
//     required this.noticeMessage,
//     required this.noticeDate,
//     required this.publishOn,
//     required this.informTo,
//     required this.activeStatus,
//     required this.isPublished,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//     required this.updatedBy,
//     required this.schoolId,
//   });

//   int id;
//   String noticeTitle;
//   String noticeMessage;
//   DateTime noticeDate;
//   DateTime publishOn;
//   String informTo;
//   int activeStatus;
//   int isPublished;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int createdBy;
//   int updatedBy;
//   int schoolId;

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         noticeTitle: json["notice_title"],
//         noticeMessage: json["notice_message"],
//         noticeDate: DateTime.parse(json["notice_date"]),
//         publishOn: DateTime.parse(json["publish_on"]),
//         informTo: json["inform_to"],
//         activeStatus: json["active_status"],
//         isPublished: json["is_published"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         createdBy: json["created_by"],
//         updatedBy: json["updated_by"],
//         schoolId: json["school_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "notice_title": noticeTitle,
//         "notice_message": noticeMessage,
//         "notice_date":
//             "${noticeDate.year.toString().padLeft(4, '0')}-${noticeDate.month.toString().padLeft(2, '0')}-${noticeDate.day.toString().padLeft(2, '0')}",
//         "publish_on":
//             "${publishOn.year.toString().padLeft(4, '0')}-${publishOn.month.toString().padLeft(2, '0')}-${publishOn.day.toString().padLeft(2, '0')}",
//         "inform_to": informTo,
//         "active_status": activeStatus,
//         "is_published": isPublished,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "created_by": createdBy,
//         "updated_by": updatedBy,
//         "school_id": schoolId,
//       };
// }

// To parse this JSON data, do
//
//     final noticeModel = noticeModelFromJson(jsonString);

import 'dart:convert';

NoticeModel noticeModelFromJson(String str) =>
    NoticeModel.fromJson(json.decode(str));

String noticeModelToJson(NoticeModel data) => json.encode(data.toJson());

class NoticeModel {
  NoticeModel({
    required this.success,
    required this.data,
    this.message,
  });

  bool success;
  Data data;
  dynamic message;

  factory NoticeModel.fromJson(Map<String, dynamic> json) => NoticeModel(
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
    required this.currentPage,
    required this.data,
    required this.lastPage,
  });

  int currentPage;
  List<Datum> data;
  int lastPage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        lastPage: json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "last_page": lastPage,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.noticeTitle,
    required this.noticeMessage,
    required this.noticeDate,
    required this.publishOn,
    required this.informTo,
    required this.activeStatus,
    required this.isPublished,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.schoolId,
  });

  int id;
  String noticeTitle;
  String noticeMessage;
  DateTime noticeDate;
  DateTime publishOn;
  String informTo;
  int activeStatus;
  int isPublished;
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;
  int updatedBy;
  int schoolId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        noticeTitle: json["notice_title"],
        noticeMessage: json["notice_message"],
        noticeDate: DateTime.parse(json["notice_date"]),
        publishOn: DateTime.parse(json["publish_on"]),
        informTo: json["inform_to"],
        activeStatus: json["active_status"],
        isPublished: json["is_published"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        schoolId: json["school_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "notice_title": noticeTitle,
        "notice_message": noticeMessage,
        "notice_date":
            "${noticeDate.year.toString().padLeft(4, '0')}-${noticeDate.month.toString().padLeft(2, '0')}-${noticeDate.day.toString().padLeft(2, '0')}",
        "publish_on":
            "${publishOn.year.toString().padLeft(4, '0')}-${publishOn.month.toString().padLeft(2, '0')}-${publishOn.day.toString().padLeft(2, '0')}",
        "inform_to": informTo,
        "active_status": activeStatus,
        "is_published": isPublished,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_by": createdBy,
        "updated_by": updatedBy,
        "school_id": schoolId,
      };
}
