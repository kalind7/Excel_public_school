class ApiUrl {
  static const String URL = "https://mis.excelpsschool.edu.np/";
  // static const String URL = "http://178.128.107.84/";
  static const String baseUrl = "https://mis.excelpsschool.edu.np/api/";
  // static const String baseUrl = "http://178.128.107.84/api/";
  static const String login = "login";
    static String noticelistCurrentIndex(id) =>
      "v2/notice-list?page=$id";
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
