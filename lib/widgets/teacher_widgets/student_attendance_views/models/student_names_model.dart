// To parse this JSON data, do
//
//     final newStudentModel = newStudentModelFromJson(jsonString);

import 'dart:convert';

StudentAttendanceListModel newStudentModelListFromJson(String str) => StudentAttendanceListModel.fromJson(json.decode(str));

String newStudentModelListToJson(StudentAttendanceListModel data) => json.encode(data.toJson());

class StudentAttendanceListModel {
  StudentAttendanceListModel({
    required this.success,
    required this.data,
    this.message,
  });

  bool success;
  Data data;
  dynamic message;

  factory StudentAttendanceListModel.fromJson(Map<String, dynamic> json) => StudentAttendanceListModel(
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
    required this.date,
    required this.alreadyAssignedStudents,
    required this.newStudents,
    required this.attendanceType,
  });

  List<Class> classes;
  DateTime date;
  List<dynamic> alreadyAssignedStudents;
  List<NewStudent> newStudents;
  String attendanceType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    classes: List<Class>.from(json["classes"].map((x) => Class.fromJson(x))),
    date: DateTime.parse(json["date"]),
    alreadyAssignedStudents: List<dynamic>.from(json["already_assigned_students"].map((x) => x)),
    newStudents: List<NewStudent>.from(json["new_students"].map((x) => NewStudent.fromJson(x))),
    attendanceType: json["attendance_type"],
  );

  Map<String, dynamic> toJson() => {
    "classes": List<dynamic>.from(classes.map((x) => x.toJson())),
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "already_assigned_students": List<dynamic>.from(alreadyAssignedStudents.map((x) => x)),
    "new_students": List<dynamic>.from(newStudents.map((x) => x.toJson())),
    "attendance_type": attendanceType,
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
    required this.sectionName,
  });

  int id;
  String className;
  int activeStatus;
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;
  int updatedBy;
  int schoolId;
  String sectionName;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    id: json["id"],
    className: json["class_name"] == null ? null : json["class_name"],
    activeStatus: json["active_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    schoolId: json["school_id"],
    sectionName: json["section_name"] == null ? null : json["section_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "class_name": className == null ? null : className,
    "active_status": activeStatus,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "created_by": createdBy,
    "updated_by": updatedBy,
    "school_id": schoolId,
    "section_name": sectionName == null ? null : sectionName,
  };
}

class NewStudent {
  NewStudent({
    required this.id,
    required this.admissionNo,
    required this.rollNo,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.dateOfBirth,
    required this.dateOfBirthAd,
    required this.caste,
    required this.email,
    required this.mobile,
    required this.admissionDate,
    this.studentPhoto,
    this.height,
    this.weight,
    required this.currentAddress,
    required this.permanentAddress,
    this.driverId,
    this.nationalIdNo,
    this.localIdNo,
    this.bankAccountNo,
    this.bankName,
    this.previousSchoolDetails,
    this.aditionalNotes,
    this.documentTitle1,
    required this.documentFile1,
    this.documentTitle2,
    required this.documentFile2,
    this.documentTitle3,
    required this.documentFile3,
    this.documentTitle4,
    required this.documentFile4,
    required this.activeStatus,
    required this.allowFeesView,
    required this.parentAllowFees,
    required this.createdAt,
    required this.updatedAt,
    this.bloodgroupId,
    required this.religionId,
    this.routeListId,
    this.dormitoryId,
    this.vechileId,
    this.roomId,
    this.studentCategoryId,
    required this.classId,
    required this.sectionId,
    required this.sessionId,
    required this.parentId,
    required this.userId,
    required this.roleId,
    required this.genderId,
    required this.createdBy,
    required this.updatedBy,
    required this.schoolId,
    required this.joinedSessionId,
    required this.newStudent,
    required this.newStudentClass,
    required this.section,
  });

  int id;
  int admissionNo;
  int rollNo;
  String firstName;
  String lastName;
  String fullName;
  String dateOfBirth;
  DateTime dateOfBirthAd;
  String caste;
  String email;
  String mobile;
  DateTime admissionDate;
  dynamic studentPhoto;
  dynamic height;
  dynamic weight;
  String currentAddress;
  String permanentAddress;
  dynamic driverId;
  dynamic nationalIdNo;
  dynamic localIdNo;
  dynamic bankAccountNo;
  dynamic bankName;
  dynamic previousSchoolDetails;
  dynamic aditionalNotes;
  dynamic documentTitle1;
  String documentFile1;
  dynamic documentTitle2;
  String documentFile2;
  dynamic documentTitle3;
  String documentFile3;
  dynamic documentTitle4;
  String documentFile4;
  int activeStatus;
  int allowFeesView;
  int parentAllowFees;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic bloodgroupId;
  int religionId;
  dynamic routeListId;
  dynamic dormitoryId;
  dynamic vechileId;
  dynamic roomId;
  dynamic studentCategoryId;
  int classId;
  int sectionId;
  int sessionId;
  int parentId;
  int userId;
  int roleId;
  int genderId;
  int createdBy;
  int updatedBy;
  int schoolId;
  int joinedSessionId;
  int newStudent;
  Class newStudentClass;
  Class section;

  factory NewStudent.fromJson(Map<String, dynamic> json) => NewStudent(
    id: json["id"],
    admissionNo: json["admission_no"],
    rollNo: json["roll_no"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    fullName: json["full_name"],
    dateOfBirth: json["date_of_birth"],
    dateOfBirthAd: json["date_of_birth_ad"] ,
    caste: json["caste"] == null ? null : json["caste"],
    email: json["email"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    admissionDate: DateTime.parse(json["admission_date"]),
    studentPhoto: json["student_photo"],
    height: json["height"],
    weight: json["weight"],
    currentAddress: json["current_address"] == null ? null : json["current_address"],
    permanentAddress: json["permanent_address"] == null ? null : json["permanent_address"],
    driverId: json["driver_id"],
    nationalIdNo: json["national_id_no"],
    localIdNo: json["local_id_no"],
    bankAccountNo: json["bank_account_no"],
    bankName: json["bank_name"],
    previousSchoolDetails: json["previous_school_details"],
    aditionalNotes: json["aditional_notes"],
    documentTitle1: json["document_title_1"],
    documentFile1: json["document_file_1"] == null ? null : json["document_file_1"],
    documentTitle2: json["document_title_2"],
    documentFile2: json["document_file_2"] == null ? null : json["document_file_2"],
    documentTitle3: json["document_title_3"],
    documentFile3: json["document_file_3"] == null ? null : json["document_file_3"],
    documentTitle4: json["document_title_4"],
    documentFile4: json["document_file_4"] == null ? null : json["document_file_4"],
    activeStatus: json["active_status"],
    allowFeesView: json["allow_fees_view"],
    parentAllowFees: json["parent_allow_fees"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    bloodgroupId: json["bloodgroup_id"],
    religionId: json["religion_id"] == null ? null : json["religion_id"],
    routeListId: json["route_list_id"],
    dormitoryId: json["dormitory_id"],
    vechileId: json["vechile_id"],
    roomId: json["room_id"],
    studentCategoryId: json["student_category_id"],
    classId: json["class_id"],
    sectionId: json["section_id"],
    sessionId: json["session_id"],
    parentId: json["parent_id"],
    userId: json["user_id"],
    roleId: json["role_id"],
    genderId: json["gender_id"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    schoolId: json["school_id"],
    joinedSessionId: json["joined_session_id"],
    newStudent: json["new_student"],
    newStudentClass: json["class"] ,
    section: json["section"] ,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admission_no": admissionNo,
    "roll_no": rollNo,
    "first_name": firstName,
    "last_name": lastName,
    "full_name": fullName,
    "date_of_birth": dateOfBirth == null ? null : dateOfBirth,
    "date_of_birth_ad": dateOfBirthAd == null ? null : "${dateOfBirthAd.year.toString().padLeft(4, '0')}-${dateOfBirthAd.month.toString().padLeft(2, '0')}-${dateOfBirthAd.day.toString().padLeft(2, '0')}",
    "caste": caste == null ? null : caste,
    "email": email,
    "mobile": mobile == null ? null : mobile,
    "admission_date": "${admissionDate.year.toString().padLeft(4, '0')}-${admissionDate.month.toString().padLeft(2, '0')}-${admissionDate.day.toString().padLeft(2, '0')}",
    "student_photo": studentPhoto,
    "height": height,
    "weight": weight,
    "current_address": currentAddress == null ? null : currentAddress,
    "permanent_address": permanentAddress == null ? null : permanentAddress,
    "driver_id": driverId,
    "national_id_no": nationalIdNo,
    "local_id_no": localIdNo,
    "bank_account_no": bankAccountNo,
    "bank_name": bankName,
    "previous_school_details": previousSchoolDetails,
    "aditional_notes": aditionalNotes,
    "document_title_1": documentTitle1,
    "document_file_1": documentFile1 == null ? null : documentFile1,
    "document_title_2": documentTitle2,
    "document_file_2": documentFile2 == null ? null : documentFile2,
    "document_title_3": documentTitle3,
    "document_file_3": documentFile3 == null ? null : documentFile3,
    "document_title_4": documentTitle4,
    "document_file_4": documentFile4 == null ? null : documentFile4,
    "active_status": activeStatus,
    "allow_fees_view": allowFeesView,
    "parent_allow_fees": parentAllowFees,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "bloodgroup_id": bloodgroupId,
    "religion_id": religionId == null ? null : religionId,
    "route_list_id": routeListId,
    "dormitory_id": dormitoryId,
    "vechile_id": vechileId,
    "room_id": roomId,
    "student_category_id": studentCategoryId,
    "class_id": classId,
    "section_id": sectionId,
    "session_id": sessionId,
    "parent_id": parentId,
    "user_id": userId,
    "role_id": roleId,
    "gender_id": genderId,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "school_id": schoolId,
    "joined_session_id": joinedSessionId,
    "new_student": newStudent,
    "class": newStudentClass == null ? null : newStudentClass.toJson(),
    "section": section == null ? null : section.toJson(),
  };
}
