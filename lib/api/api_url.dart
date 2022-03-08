class ApiUrl {
  // static const String URL = "https://mis.excelpsschool.edu.np/";
  static const String URL = "https://ems.allstar.com.np/";
  // static const String baseUrl = "https://mis.excelpsschool.edu.np/api/";
  static const String baseUrl = "https://ems.allstar.com.np/api/";

  static const String login = "v2/auth/login";
  static const String studentUploadHomework = "v2/student-upload-homework";
  static const String refreshToken = "v2/refresh";
  static String studentHomework(duration, id) =>
      "v2/homeworklist?days=$duration&page=$id";
  static String studentSubmittedHomeworkView(id) =>
      "v2/student-upload-homework-view?homework_id=$id";

  static String noticelistCurrentIndex(id) => "notice-list?page=$id";
  static String eventList(year, month) => 'event?year=$year&month=$month';
  static String studentFees(studentid) => 'student-fees/$studentid';
  static String studentFeesDetail(studentid, feeid, type) =>
      'student-fees-details/$studentid?id=$feeid&type=$type';
  static String studentattendencelist(year, month) =>
      'v2/student-my-attendance?year=$year&month=$month';

  static const String teacherAttendanceList = "student-search";
  // static String teacherAttendanceList(classes,section,date) => 'student-search?class=$classes&section=$section&attendance_date=$date';
  // static const String {} = "v2/notice-list?page=14";
}

class Constants {
  static const String APPNAME = "Excel";
  static const String userId = "userId";
  static const String isLoggedIn = "isLoggedIn";
  static const String name = "name";
  static const String userName = "userName";
  static const String className = "9";
  static const String sectionName = "A";
  static const String email = "email";
  static const int admissionNumber = 1;
  static const String roll = "roll";
  static const String profileImage = "profileImage";
  static const String accesstoken = "token";
}
