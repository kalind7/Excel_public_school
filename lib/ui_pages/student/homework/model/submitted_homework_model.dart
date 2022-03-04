// To parse this JSON data, do
//
//     final submittedHomeworkModel = submittedHomeworkModelFromJson(jsonString);

import 'dart:convert';

SubmittedHomeworkModel submittedHomeworkModelFromJson(String str) =>
    SubmittedHomeworkModel.fromJson(json.decode(str));

String submittedHomeworkModelToJson(SubmittedHomeworkModel data) =>
    json.encode(data.toJson());

class SubmittedHomeworkModel {
  SubmittedHomeworkModel({
    required this.success,
    this.data,
    this.message,
  });

  bool success;
  Data? data;
  dynamic message;

  factory SubmittedHomeworkModel.fromJson(Map<String, dynamic> json) =>
      SubmittedHomeworkModel(
        success: json["success"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data!.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.homeworkUploadDetails,
  });

  List<HomeworkUploadDetail> homeworkUploadDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        homeworkUploadDetails: List<HomeworkUploadDetail>.from(
            json["homeworkUploadDetails"]
                .map((x) => HomeworkUploadDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "homeworkUploadDetails":
            List<dynamic>.from(homeworkUploadDetails.map((x) => x.toJson())),
      };
}

class HomeworkUploadDetail {
  HomeworkUploadDetail({
    required this.id,
    this.file,
    required this.studentId,
    required this.homeworkId,
    this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String? file;
  int studentId;
  int homeworkId;
  dynamic comment;
  DateTime createdAt;
  DateTime updatedAt;

  factory HomeworkUploadDetail.fromJson(Map<String, dynamic> json) =>
      HomeworkUploadDetail(
        id: json["id"],
        file: json["file"] ?? "",
        studentId: json["student_id"],
        homeworkId: json["homework_id"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file": file,
        "student_id": studentId,
        "homework_id": homeworkId,
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
