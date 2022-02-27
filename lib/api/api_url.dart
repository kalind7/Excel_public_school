class ApiUrl {
  // static const String URL = "https://mis.excelpsschool.edu.np/";
  static const String URL = "https://ems.allstar.com.np/";
  // static const String baseUrl = "https://mis.excelpsschool.edu.np/api/";
  static const String baseUrl = "https://ems.allstar.com.np/api/";
  static const String login = "login";
  static String noticelistCurrentIndex(id) => "notice-list?page=$id";
  static String eventList(year, month) => 'event?year=$year&month=$month';
  static String studentFees(studentid) => 'student-fees/$studentid';
  static String studentFeesDetail(studentid, feeid, type) =>
      'student-fees-details/$studentid?id=$feeid&type=$type';
  static String studentattendencelist(id, year, month) =>
      'student-my-attendance/$id?year=$year&month=$month';

  // static const String {} = "v2/notice-list?page=14";
}

class Constants {
  static const String APPNAME = "Excel";
  static const String userId = "userId";
  static const String isLoggedIn = "isLoggedIn";
  static const String name = "name";
  static const String userName = "userName";
  static const String roll = "roll";
  static const String profileImage = "profileImage";
}
