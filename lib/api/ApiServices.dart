// import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/global/alert.dart';
import 'package:new_project_work/utils/constant.dart';

class ApiServices {
  Future get(String endpoint) async {
    try {
      var response = await http.get(Uri.parse(ApiUrl.baseUrl + endpoint));
      return response.body;
    } catch (e) {
      Alert.showSnackBar(e.toString(), true);
    }
  }

  Future post(url, data) async {
    try {
      var res;
      var response = await http.post(Uri.parse(ApiUrl.baseUrl + url),
          headers: setHeaders(), body: jsonEncode(data));

      if (response.statusCode == 200) {
        res = response.body;
      } else {
        res = {
          "success": false,
          // "status": response.statusCode,
          "message": "failed"
        };
      }

      return res;
    } catch (e) {
      Alert.showSnackBar(e.toString(), true);
    }

    //  on DioError catch (e) {
    //   if (e.response!.statusCode == 400) {
    //     return e.response?.data;
    //   } else {
    //     throw Exception(getDioException(e));
    //   }
    // }
  }
}
