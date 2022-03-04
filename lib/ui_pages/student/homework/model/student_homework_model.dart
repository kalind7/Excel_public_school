// To parse  this JSON data, do
//
//     final studentHomeWorkModel = studentHomeWorkModelFromJson(jsonString);

import 'dart:convert';

StudentHomeWorkModel studentHomeWorkModelFromJson(String str) =>
    StudentHomeWorkModel.fromJson(json.decode(str));

String studentHomeWorkModelToJson(StudentHomeWorkModel data) =>
    json.encode(data.toJson());

class StudentHomeWorkModel {
  StudentHomeWorkModel({
    required this.success,
    this.data,
    required this.message,
  });

  bool success;
  Data? data;
  String message;

  factory StudentHomeWorkModel.fromJson(Map<String, dynamic> json) =>
      StudentHomeWorkModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
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
    required this.currentPage,
    required this.data,
    required this.lastPage,
  });

  int currentPage;
  List<StudentHomeWorkData> data;

  int lastPage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<StudentHomeWorkData>.from(
            json["data"].map((x) => StudentHomeWorkData.fromJson(x))),
        lastPage: json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "last_page": lastPage,
      };
}

class StudentHomeWorkData {
  StudentHomeWorkData({
    required this.id,
    required this.homeworkDate,
    required this.submissionDate,
    required this.evaluationDate,
    required this.file,
    required this.marks,
    required this.description,
    required this.activeStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.evaluatedBy,
    required this.sessionId,
    required this.classId,
    required this.sectionId,
    required this.subjectId,
    required this.createdBy,
    required this.updatedBy,
    required this.schoolId,
    required this.subjectName,
    required this.creatorName,
    required this.subjects,
    required this.users,
  });

  int id;
  DateTime homeworkDate;
  DateTime submissionDate;
  dynamic evaluationDate;
  String file;
  dynamic marks;
  String description;
  int activeStatus;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic evaluatedBy;
  int sessionId;
  int classId;
  int sectionId;
  int subjectId;
  int createdBy;
  int updatedBy;
  int schoolId;
  String subjectName;
  String creatorName;
  Subjects subjects;
  Users users;

  factory StudentHomeWorkData.fromJson(Map<String, dynamic> json) =>
      StudentHomeWorkData(
        id: json["id"],
        homeworkDate: DateTime.parse(json["homework_date"]),
        submissionDate: DateTime.parse(json["submission_date"]),
        evaluationDate: json["evaluation_date"],
        file: json["file"],
        marks: json["marks"],
        description: json["description"],
        activeStatus: json["active_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        evaluatedBy: json["evaluated_by"],
        sessionId: json["session_id"],
        classId: json["class_id"],
        sectionId: json["section_id"],
        subjectId: json["subject_id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        schoolId: json["school_id"],
        subjectName: json["subject_name"],
        creatorName: json["creator_name"],
        subjects: Subjects.fromJson(json["subjects"]),
        users: Users.fromJson(json["users"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "homework_date":
            "${homeworkDate.year.toString().padLeft(4, '0')}-${homeworkDate.month.toString().padLeft(2, '0')}-${homeworkDate.day.toString().padLeft(2, '0')}",
        "submission_date":
            "${submissionDate.year.toString().padLeft(4, '0')}-${submissionDate.month.toString().padLeft(2, '0')}-${submissionDate.day.toString().padLeft(2, '0')}",
        "evaluation_date": evaluationDate,
        "file": file,
        "marks": marks,
        "description": description,
        "active_status": activeStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "evaluated_by": evaluatedBy,
        "session_id": sessionId,
        "class_id": classId,
        "section_id": sectionId,
        "subject_id": subjectId,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "school_id": schoolId,
        "subject_name": subjectName,
        "creator_name": creatorName,
        "subjects": subjects.toJson(),
        "users": users.toJson(),
      };
}

class Subjects {
  Subjects({
    required this.id,
    required this.subjectName,
    required this.subjectCode,
    required this.subjectType,
    required this.classId,
    required this.activeStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.schoolId,
  });

  int id;
  String subjectName;
  dynamic subjectCode;
  String subjectType;
  int classId;
  int activeStatus;
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;
  int updatedBy;
  int schoolId;

  factory Subjects.fromJson(Map<String, dynamic> json) => Subjects(
        id: json["id"],
        subjectName: json["subject_name"],
        subjectCode: json["subject_code"],
        subjectType: json["subject_type"],
        classId: json["class_id"],
        activeStatus: json["active_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        schoolId: json["school_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject_name": subjectName,
        "subject_code": subjectCode,
        "subject_type": subjectType,
        "class_id": classId,
        "active_status": activeStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_by": createdBy,
        "updated_by": updatedBy,
        "school_id": schoolId,
      };
}

class Users {
  Users({
    required this.id,
    required this.fullName,
    required this.username,
    required this.email,
    required this.usertype,
    required this.accessStatus,
    required this.activeStatus,
    required this.notificationToken,
    required this.lastLogin,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.schoolId,
    required this.roleId,
  });

  int id;
  String fullName;
  String username;
  String email;
  dynamic usertype;
  int accessStatus;
  int activeStatus;

  dynamic notificationToken;
  DateTime lastLogin;
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;
  int updatedBy;
  int schoolId;
  int roleId;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        fullName: json["full_name"],
        username: json["username"],
        email: json["email"],
        usertype: json["usertype"],
        accessStatus: json["access_status"],
        activeStatus: json["active_status"],
        notificationToken: json["notificationToken"],
        lastLogin: DateTime.parse(json["last_login"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        schoolId: json["school_id"],
        roleId: json["role_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "username": username,
        "email": email,
        "usertype": usertype,
        "access_status": accessStatus,
        "active_status": activeStatus,
        "notificationToken": notificationToken,
        "last_login": lastLogin.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_by": createdBy,
        "updated_by": updatedBy,
        "school_id": schoolId,
        "role_id": roleId,
      };
}
