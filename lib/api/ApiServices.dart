// import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/global/alert.dart';
import 'package:new_project_work/route/router_constant.dart';
import 'package:new_project_work/utils/constant.dart';

class ApiServices {
  Future get(String endpoint) async {
    try {
      var response = await http.get(Uri.parse(ApiUrl.baseUrl + endpoint));

      return response.body;
    } catch (e) {
      Alert.showSnackBar(title: 'Error', message: e.toString(), top: true);
    }
  }

  // Future<void> refreshToken() async {
  //   await Hive.openBox(Constants.APPNAME);
  //   var box = Hive.box(Constants.APPNAME);
  //   final oldToken = box.get(Constants.accesstoken);

  //     var response = await http.post(Uri.parse(ApiUrl.baseUrl + url),
  //         headers: setHeaders(), body: {'token': oldToken});
  //   // final response =
  //   //     await this.api.post('/users/refresh', data: {'token': oldToken});
  //   if (response.statusCode == 200) {
  //     this.accessToken = response.data['accessToken'];
  //   }
  // }

  Future getWithToken(String endpoint) async {
    try {
      await Hive.openBox(Constants.APPNAME);
      var box = Hive.box(Constants.APPNAME);
      final token = box.get(Constants.accesstoken);
      var response =
          await http.get(Uri.parse(ApiUrl.baseUrl + endpoint), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 403) {
        Alert.showSnackBar(
            title: 'Token Expire',
            message: 'Token Expire please login'.toString(),
            top: true);
        box.clear();

        Get.deleteAll();
        Get.offNamed(loginRoute);
      } else {
        return response.body;
      }
    } catch (e) {
      Alert.showSnackBar(title: 'Error', message: e.toString(), top: true);
    }
  }

  // Future postWithToken(String url, data) async {
  //   try {
  //     var response = await http.post(Uri.parse(ApiUrl.baseUrl + url),
  //         headers: setHeaders(), body: jsonEncode(data));

  //     return response.body;
  //   } catch (e) {
  //     Alert.showSnackBar(title: 'Error', message: e.toString(), top: true);
  //   }
  // }

  Future post(url, data) async {
    try {
      var response = await http.post(Uri.parse(ApiUrl.baseUrl + url),
          headers: setHeaders(), body: jsonEncode(data));

      return response.body;
    } catch (e) {
      Alert.showSnackBar(title: 'Error', message: e.toString(), top: true);
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
