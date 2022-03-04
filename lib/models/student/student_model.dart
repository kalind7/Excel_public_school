// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  bool success;
  Data? data;
  String message;

  Welcome({
    required this.success,
    this.data,
    required this.message,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        success: json["success"],
        data: (json['data'] != null ? Data.fromJson(json['data']) : null),
        // data: json['data'] != null ? new Data.fromJson(json['data']) : null;
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
    required this.token,
    required this.user,
    required this.userDetails,
    this.religion,
    this.bloodGroup,
    this.transport,
  });
  String token;
  User user;
  dynamic userDetails;
  dynamic religion;
  dynamic bloodGroup;
  dynamic transport;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: User.fromJson(json["user"]),
        userDetails: User.fromJson(json["user"]).roleId == 2
            ? UserDetails.fromJson(json["userDetails"])
            : TeacherDetails.fromJson(json["userDetails"]),
        religion: json["religion"],
        bloodGroup: json["blood_group"],
        transport: json["transport"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
        "userDetails": userDetails.toJson(),
        "religion": religion,
        "blood_group": bloodGroup,
        "transport": transport,
      };
}

class User {
  User({
    required this.id,
    required this.fullName,
    required this.username,
    required this.email,
    this.usertype,
    required this.accessStatus,
    required this.activeStatus,
    this.notificationToken,
    this.lastLogin,
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
  dynamic lastLogin;
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;
  int updatedBy;
  int schoolId;
  int roleId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        username: json["username"],
        email: json["email"],
        usertype: json["usertype"] ?? "",
        accessStatus: json["access_status"],
        activeStatus: json["active_status"],
        notificationToken: json["notificationToken"],
        lastLogin: json["last_login"],
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
        "last_login": lastLogin,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_by": createdBy,
        "updated_by": updatedBy,
        "school_id": schoolId,
        "role_id": roleId,
      };
}

class UserDetails {
  UserDetails({
    required this.id,
    required this.admissionNo,
    required this.rollNo,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    this.dateOfBirth,
    this.dateOfBirthAd,
    this.caste,
    required this.email,
    this.mobile,
    required this.admissionDate,
    this.studentPhoto,
    this.height,
    this.weight,
    this.currentAddress,
    this.permanentAddress,
    this.driverId,
    this.nationalIdNo,
    this.localIdNo,
    this.bankAccountNo,
    this.bankName,
    this.previousSchoolDetails,
    this.aditionalNotes,
    this.documentTitle1,
    this.documentFile1,
    this.documentTitle2,
    this.documentFile2,
    this.documentTitle3,
    this.documentFile3,
    this.documentTitle4,
    this.documentFile4,
    required this.activeStatus,
    required this.allowFeesView,
    required this.parentAllowFees,
    required this.createdAt,
    required this.updatedAt,
    this.bloodgroupId,
    this.religionId,
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
    required this.fathersName,
    required this.fathersMobile,
    this.fathersOccupation,
    this.fathersPhoto,
    this.mothersName,
    this.mothersMobile,
    this.mothersOccupation,
    this.mothersPhoto,
    this.relation,
    required this.guardiansName,
    required this.guardiansMobile,
    required this.guardiansEmail,
    this.guardiansOccupation,
    this.guardiansRelation,
    this.guardiansPhoto,
    this.guardiansAddress,
    this.isGuardian,
    required this.className,
    required this.sectionName,
  });

  int id;
  int admissionNo;
  int rollNo;
  String firstName;
  String lastName;
  String fullName;
  dynamic dateOfBirth;
  dynamic dateOfBirthAd;
  dynamic caste;
  String email;
  dynamic mobile;
  DateTime admissionDate;
  dynamic studentPhoto;
  dynamic height;
  dynamic weight;
  dynamic currentAddress;
  dynamic permanentAddress;
  dynamic driverId;
  dynamic nationalIdNo;
  dynamic localIdNo;
  dynamic bankAccountNo;
  dynamic bankName;
  dynamic previousSchoolDetails;
  dynamic aditionalNotes;
  dynamic documentTitle1;
  dynamic documentFile1;
  dynamic documentTitle2;
  dynamic documentFile2;
  dynamic documentTitle3;
  dynamic documentFile3;
  dynamic documentTitle4;
  dynamic documentFile4;
  int activeStatus;
  int allowFeesView;
  int parentAllowFees;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic bloodgroupId;
  dynamic religionId;
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
  String fathersName;
  String fathersMobile;
  dynamic fathersOccupation;
  dynamic fathersPhoto;
  dynamic mothersName;
  dynamic mothersMobile;
  dynamic mothersOccupation;
  dynamic mothersPhoto;
  dynamic relation;
  String guardiansName;
  String guardiansMobile;
  String guardiansEmail;
  dynamic guardiansOccupation;
  dynamic guardiansRelation;
  dynamic guardiansPhoto;
  dynamic guardiansAddress;
  dynamic isGuardian;
  String className;
  String sectionName;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        admissionNo: json["admission_no"] ?? "",
        rollNo: json["roll_no"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        fullName: json["full_name"],
        dateOfBirth: json["date_of_birth"],
        dateOfBirthAd: json["date_of_birth_ad"],
        caste: json["caste"],
        email: json["email"],
        mobile: json["mobile"],
        admissionDate: DateTime.parse(json["admission_date"]),
        studentPhoto: json["student_photo"],
        height: json["height"],
        weight: json["weight"],
        currentAddress: json["current_address"],
        permanentAddress: json["permanent_address"],
        driverId: json["driver_id"],
        nationalIdNo: json["national_id_no"],
        localIdNo: json["local_id_no"],
        bankAccountNo: json["bank_account_no"],
        bankName: json["bank_name"],
        previousSchoolDetails: json["previous_school_details"],
        aditionalNotes: json["aditional_notes"],
        documentTitle1: json["document_title_1"],
        documentFile1: json["document_file_1"],
        documentTitle2: json["document_title_2"],
        documentFile2: json["document_file_2"],
        documentTitle3: json["document_title_3"],
        documentFile3: json["document_file_3"],
        documentTitle4: json["document_title_4"],
        documentFile4: json["document_file_4"],
        activeStatus: json["active_status"],
        allowFeesView: json["allow_fees_view"],
        parentAllowFees: json["parent_allow_fees"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        bloodgroupId: json["bloodgroup_id"],
        religionId: json["religion_id"],
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
        fathersName: json["fathers_name"],
        fathersMobile: json["fathers_mobile"],
        fathersOccupation: json["fathers_occupation"],
        fathersPhoto: json["fathers_photo"],
        mothersName: json["mothers_name"],
        mothersMobile: json["mothers_mobile"],
        mothersOccupation: json["mothers_occupation"],
        mothersPhoto: json["mothers_photo"],
        relation: json["relation"],
        guardiansName: json["guardians_name"],
        guardiansMobile: json["guardians_mobile"],
        guardiansEmail: json["guardians_email"],
        guardiansOccupation: json["guardians_occupation"],
        guardiansRelation: json["guardians_relation"],
        guardiansPhoto: json["guardians_photo"],
        guardiansAddress: json["guardians_address"],
        isGuardian: json["is_guardian"],
        className: json["class_name"],
        sectionName: json["section_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admission_no": admissionNo,
        "roll_no": rollNo,
        "first_name": firstName,
        "last_name": lastName,
        "full_name": fullName,
        "date_of_birth": dateOfBirth,
        "date_of_birth_ad": dateOfBirthAd,
        "caste": caste,
        "email": email,
        "mobile": mobile,
        "admission_date":
            "${admissionDate.year.toString().padLeft(4, '0')}-${admissionDate.month.toString().padLeft(2, '0')}-${admissionDate.day.toString().padLeft(2, '0')}",
        "student_photo": studentPhoto,
        "height": height,
        "weight": weight,
        "current_address": currentAddress,
        "permanent_address": permanentAddress,
        "driver_id": driverId,
        "national_id_no": nationalIdNo,
        "local_id_no": localIdNo,
        "bank_account_no": bankAccountNo,
        "bank_name": bankName,
        "previous_school_details": previousSchoolDetails,
        "aditional_notes": aditionalNotes,
        "document_title_1": documentTitle1,
        "document_file_1": documentFile1,
        "document_title_2": documentTitle2,
        "document_file_2": documentFile2,
        "document_title_3": documentTitle3,
        "document_file_3": documentFile3,
        "document_title_4": documentTitle4,
        "document_file_4": documentFile4,
        "active_status": activeStatus,
        "allow_fees_view": allowFeesView,
        "parent_allow_fees": parentAllowFees,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "bloodgroup_id": bloodgroupId,
        "religion_id": religionId,
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
        "fathers_name": fathersName,
        "fathers_mobile": fathersMobile,
        "fathers_occupation": fathersOccupation,
        "fathers_photo": fathersPhoto,
        "mothers_name": mothersName,
        "mothers_mobile": mothersMobile,
        "mothers_occupation": mothersOccupation,
        "mothers_photo": mothersPhoto,
        "relation": relation,
        "guardians_name": guardiansName,
        "guardians_mobile": guardiansMobile,
        "guardians_email": guardiansEmail,
        "guardians_occupation": guardiansOccupation,
        "guardians_relation": guardiansRelation,
        "guardians_photo": guardiansPhoto,
        "guardians_address": guardiansAddress,
        "is_guardian": isGuardian,
        "class_name": className,
        "section_name": sectionName,
      };
}

// class TeacherDetails {
//   int id;
//   int staffNo;
//   String firstName;
//   String lastName;
//   String fullName;
//   String fathersName;
//   String mothersName;
//   String dateOfBirth;
//   String dateOfJoining;
//   String email;
//   String mobile;
//   String emergencyMobile;
//   String maritalStatus;
//   String staffPhoto;
//   String currentAddress;
//   String permanentAddress;
//   String qualification;
//   String experience;
//   Null epfNo;
//   String basicSalary;
//   Null contractType;
//   Null location;
//   Null casualLeave;
//   Null medicalLeave;
//   Null metarnityLeave;
//   Null bankAccountName;
//   Null bankAccountNo;
//   Null bankName;
//   Null bankBrach;
//   Null facebookUrl;
//   Null twiteerUrl;
//   Null linkedinUrl;
//   Null instragramUrl;
//   String joiningLetter;
//   String resume;
//   String otherDocument;
//   Null notes;
//   int activeStatus;
//   Null drivingLicense;
//   Null drivingLicenseExDate;
//   String createdAt;
//   String updatedAt;
//   int designationId;
//   int departmentId;
//   int userId;
//   int roleId;
//   int genderId;
//   int createdBy;
//   int updatedBy;
//   int schoolId;

//   TeacherDetails(
//       {required this.id,
//       required this.staffNo,
//       required this.firstName,
//       required this.lastName,
//       required this.fullName,
//       required this.fathersName,
//       required this.mothersName,
//       required this.dateOfBirth,
//       required this.dateOfJoining,
//       required this.email,
//       required this.mobile,
//       required this.emergencyMobile,
//       required this.maritalStatus,
//       required this.staffPhoto,
//       required this.currentAddress,
//       required this.permanentAddress,
//       required this.qualification,
//       required this.experience,
//       this.epfNo,
//       required this.basicSalary,
//       this.contractType,
//       this.location,
//       this.casualLeave,
//       this.medicalLeave,
//       this.metarnityLeave,
//       this.bankAccountName,
//       this.bankAccountNo,
//       this.bankName,
//       this.bankBrach,
//       this.facebookUrl,
//       this.twiteerUrl,
//       this.linkedinUrl,
//       this.instragramUrl,
//       required this.joiningLetter,
//       required this.resume,
//       required this.otherDocument,
//       this.notes,
//       required this.activeStatus,
//       this.drivingLicense,
//       this.drivingLicenseExDate,
//       required this.createdAt,
//       required this.updatedAt,
//       required this.designationId,
//       required this.departmentId,
//       required this.userId,
//       required this.roleId,
//       required this.genderId,
//       required this.createdBy,
//       required this.updatedBy,
//       required this.schoolId}) {

//     throw UnimplementedError();
//   }

//   // UserDetails.fromJson(Map<String, dynamic> json) {

//   factory TeacherDetails.fromJson(Map<String, dynamic> json) => TeacherDetails(

//     id: json['id'],
//     staffNo = json['staff_no'],
//     firstName = json['first_name'],
//     lastName = json['last_name'],
//     fullName = json['full_name'];
//     fathersName = json['fathers_name'];
//     mothersName = json['mothers_name'];
//     dateOfBirth = json['date_of_birth'];
//     dateOfJoining = json['date_of_joining'];
//     email = json['email'];
//     mobile = json['mobile'];
//     emergencyMobile = json['emergency_mobile'];
//     maritalStatus = json['marital_status'];
//     staffPhoto = json['staff_photo'];
//     currentAddress = json['current_address'];
//     permanentAddress = json['permanent_address'];
//     qualification = json['qualification'];
//     experience = json['experience'];
//     epfNo = json['epf_no'];
//     basicSalary = json['basic_salary'];
//     contractType = json['contract_type'];
//     location = json['location'];
//     casualLeave = json['casual_leave'];
//     medicalLeave = json['medical_leave'];
//     metarnityLeave = json['metarnity_leave'];
//     bankAccountName = json['bank_account_name'];
//     bankAccountNo = json['bank_account_no'];
//     bankName = json['bank_name'];
//     bankBrach = json['bank_brach'];
//     facebookUrl = json['facebook_url'];
//     twiteerUrl = json['twiteer_url'];
//     linkedinUrl = json['linkedin_url'];
//     instragramUrl = json['instragram_url'];
//     joiningLetter = json['joining_letter'];
//     resume = json['resume'];
//     otherDocument = json['other_document'];
//     notes = json['notes'];
//     activeStatus = json['active_status'];
//     drivingLicense = json['driving_license'];
//     drivingLicenseExDate = json['driving_license_ex_date'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     designationId = json['designation_id'];
//     departmentId = json['department_id'];
//     userId = json['user_id'];
//     roleId = json['role_id'];
//     genderId = json['gender_id'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//     schoolId = json['school_id'];
//   );

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['staff_no'] = this.staffNo;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['full_name'] = this.fullName;
//     data['fathers_name'] = this.fathersName;
//     data['mothers_name'] = this.mothersName;
//     data['date_of_birth'] = this.dateOfBirth;
//     data['date_of_joining'] = this.dateOfJoining;
//     data['email'] = this.email;
//     data['mobile'] = this.mobile;
//     data['emergency_mobile'] = this.emergencyMobile;
//     data['marital_status'] = this.maritalStatus;
//     data['staff_photo'] = this.staffPhoto;
//     data['current_address'] = this.currentAddress;
//     data['permanent_address'] = this.permanentAddress;
//     data['qualification'] = this.qualification;
//     data['experience'] = this.experience;
//     data['epf_no'] = this.epfNo;
//     data['basic_salary'] = this.basicSalary;
//     data['contract_type'] = this.contractType;
//     data['location'] = this.location;
//     data['casual_leave'] = this.casualLeave;
//     data['medical_leave'] = this.medicalLeave;
//     data['metarnity_leave'] = this.metarnityLeave;
//     data['bank_account_name'] = this.bankAccountName;
//     data['bank_account_no'] = this.bankAccountNo;
//     data['bank_name'] = this.bankName;
//     data['bank_brach'] = this.bankBrach;
//     data['facebook_url'] = this.facebookUrl;
//     data['twiteer_url'] = this.twiteerUrl;
//     data['linkedin_url'] = this.linkedinUrl;
//     data['instragram_url'] = this.instragramUrl;
//     data['joining_letter'] = this.joiningLetter;
//     data['resume'] = this.resume;
//     data['other_document'] = this.otherDocument;
//     data['notes'] = this.notes;
//     data['active_status'] = this.activeStatus;
//     data['driving_license'] = this.drivingLicense;
//     data['driving_license_ex_date'] = this.drivingLicenseExDate;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['designation_id'] = this.designationId;
//     data['department_id'] = this.departmentId;
//     data['user_id'] = this.userId;
//     data['role_id'] = this.roleId;
//     data['gender_id'] = this.genderId;
//     data['created_by'] = this.createdBy;
//     data['updated_by'] = this.updatedBy;
//     data['school_id'] = this.schoolId;
//     return data;
//   }
// }

class TeacherDetails {
  TeacherDetails(
      {required this.id,
      required this.staffNo,
      required this.firstName,
      required this.lastName,
      required this.fullName,
      required this.fathersName,
      required this.mothersName,
      required this.dateOfBirth,
      required this.dateOfJoining,
      required this.email,
      required this.mobile,
      required this.emergencyMobile,
      required this.maritalStatus,
      required this.staffPhoto,
      required this.currentAddress,
      required this.permanentAddress,
      required this.qualification,
      required this.experience,
      this.epfNo,
      required this.basicSalary,
      this.contractType,
      this.location,
      this.casualLeave,
      this.medicalLeave,
      this.metarnityLeave,
      this.bankAccountName,
      this.bankAccountNo,
      this.bankName,
      this.bankBrach,
      this.facebookUrl,
      this.twiteerUrl,
      this.linkedinUrl,
      this.instragramUrl,
      required this.joiningLetter,
      required this.resume,
      required this.otherDocument,
      this.notes,
      required this.activeStatus,
      this.drivingLicense,
      this.drivingLicenseExDate,
      required this.createdAt,
      required this.updatedAt,
      required this.designationId,
      required this.departmentId,
      required this.userId,
      required this.roleId,
      required this.genderId,
      required this.createdBy,
      required this.updatedBy,
      required this.schoolId});

  int id;
  int staffNo;
  String firstName;
  String lastName;
  String fullName;
  String fathersName;
  String mothersName;
  DateTime dateOfBirth;
  DateTime dateOfJoining;
  String email;
  String mobile;
  String emergencyMobile;
  String maritalStatus;
  String staffPhoto;
  String currentAddress;
  String permanentAddress;
  String qualification;
  String experience;
  dynamic epfNo;
  String basicSalary;
  dynamic contractType;
  dynamic location;
  dynamic casualLeave;
  dynamic medicalLeave;
  dynamic metarnityLeave;
  dynamic bankAccountName;
  dynamic bankAccountNo;
  dynamic bankName;
  dynamic bankBrach;
  dynamic facebookUrl;
  dynamic twiteerUrl;
  dynamic linkedinUrl;
  dynamic instragramUrl;
  String joiningLetter;
  String resume;
  String otherDocument;
  dynamic notes;
  int activeStatus;
  dynamic drivingLicense;
  dynamic drivingLicenseExDate;
  DateTime createdAt;
  DateTime updatedAt;
  int designationId;
  int departmentId;
  int userId;
  int roleId;
  int genderId;
  int createdBy;
  int updatedBy;
  int schoolId;

  factory TeacherDetails.fromJson(Map<String, dynamic> json) => TeacherDetails(
        id: json["id"],
        staffNo: json["staff_no"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        fullName: json["full_name"],
        fathersName: json["fathers_name"],
        mothersName: json["mothers_name"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        dateOfJoining: DateTime.parse(json["date_of_joining"]),
        email: json["email"],
        mobile: json["mobile"],
        emergencyMobile: json["emergency_mobile"],
        maritalStatus: json["marital_status"],
        staffPhoto: json["staff_photo"],
        currentAddress: json["current_address"],
        permanentAddress: json["permanent_address"],
        qualification: json["qualification"],
        experience: json["experience"],
        epfNo: json["epf_no"],
        basicSalary: json["basic_salary"],
        contractType: json["contract_type"],
        location: json["location"],
        casualLeave: json["casual_leave"],
        medicalLeave: json["medical_leave"],
        metarnityLeave: json["metarnity_leave"],
        bankAccountName: json["bank_account_name"],
        bankAccountNo: json["bank_account_no"],
        bankName: json["bank_name"],
        bankBrach: json["bank_brach"],
        facebookUrl: json["facebook_url"],
        twiteerUrl: json["twiteer_url"],
        linkedinUrl: json["linkedin_url"],
        instragramUrl: json["instragram_url"],
        joiningLetter: json["joining_letter"],
        resume: json["resume"],
        otherDocument: json["other_document"],
        notes: json["notes"],
        activeStatus: json["active_status"],
        drivingLicense: json["driving_license"],
        drivingLicenseExDate: json["driving_license_ex_date"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        designationId: json["designation_id"],
        departmentId: json["department_id"],
        userId: json["user_id"],
        roleId: json["role_id"],
        genderId: json["gender_id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        schoolId: json["school_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "staff_no": staffNo,
        "first_name": firstName,
        "last_name": lastName,
        "full_name": fullName,
        "fathers_name": fathersName,
        "mothers_name": mothersName,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "date_of_joining":
            "${dateOfJoining.year.toString().padLeft(4, '0')}-${dateOfJoining.month.toString().padLeft(2, '0')}-${dateOfJoining.day.toString().padLeft(2, '0')}",
        "email": email,
        "mobile": mobile,
        "emergency_mobile": emergencyMobile,
        "marital_status": maritalStatus,
        "staff_photo": staffPhoto,
        "current_address": currentAddress,
        "permanent_address": permanentAddress,
        "qualification": qualification,
        "experience": experience,
        "epf_no": epfNo,
        "basic_salary": basicSalary,
        "contract_type": contractType,
        "location": location,
        "casual_leave": casualLeave,
        "medical_leave": medicalLeave,
        "metarnity_leave": metarnityLeave,
        "bank_account_name": bankAccountName,
        "bank_account_no": bankAccountNo,
        "bank_name": bankName,
        "bank_brach": bankBrach,
        "facebook_url": facebookUrl,
        "twiteer_url": twiteerUrl,
        "linkedin_url": linkedinUrl,
        "instragram_url": instragramUrl,
        "joining_letter": joiningLetter,
        "resume": resume,
        "other_document": otherDocument,
        "notes": notes,
        "active_status": activeStatus,
        "driving_license": drivingLicense,
        "driving_license_ex_date": drivingLicenseExDate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "designation_id": designationId,
        "department_id": departmentId,
        "user_id": userId,
        "role_id": roleId,
        "gender_id": genderId,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "school_id": schoolId,
      };
}
