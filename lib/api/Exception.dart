// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:new_project_work/global/alert.dart';

// String getDioException(error) {
//   if (error is Exception) {
//     String _errorMsg;
//     try {
//       if (error is DioError) {
//         switch (error.type) {
//           case DioErrorType.cancel:
//             _errorMsg = "Request Cancelled";
//             Alert.showSnackBar(_errorMsg);

//             break;
//           case DioErrorType.connectTimeout:
//             _errorMsg = "Connection request timeout";
//             Alert.showSnackBar(_errorMsg);
//             break;
//           case DioErrorType.other:
//             _errorMsg = "No internet connection";
//             Alert.showSnackBar(_errorMsg);
//             break;
//           case DioErrorType.receiveTimeout:
//             _errorMsg = "Send timeout in connection with API server";
//             Alert.showSnackBar(_errorMsg);
//             break;
//           case DioErrorType.response:
//             _errorMsg = handleResponse(error.response!.statusCode!);
//             Alert.showSnackBar(_errorMsg);
//             break;
//           case DioErrorType.sendTimeout:
//             _errorMsg = "Send timeout in connection with API server";
//             Alert.showSnackBar(_errorMsg);
//             break;
//         }
//       } else if (error is SocketException) {
//         _errorMsg = "No internet connection";
//         Alert.showSnackBar(_errorMsg);
//       } else {
//         _errorMsg = "Unexpected error occurred";
//         Alert.showSnackBar(_errorMsg);
//       }
//       return _errorMsg;
//     } on FormatException catch (e) {
// // Helper.printError(e.toString());
//       return "Unexpected error occurred";
//     } catch (_) {
//       return "Unexpected error occurred";
//     }
//   } else {
//     if (error.toString().contains("is not a subtype of")) {
//       return "Unexpected error occurred";
//     } else {
//       return "Unexpected error occurred";
//     }
//   }
// }

// String handleResponse(int statusCode) {
//   switch (statusCode) {
//     case 401:
//       return "Credentials mismatched";

//     case 400:
//       return "Bad Request";
//     case 403:
//       return "Unauthorized request";

//     case 404:
//       return "Not found";

//     case 409:
//       return "Error due to a conflict";

//     case 408:
//       return "Connection request timeout";

//     case 500:
//       return "Internal Server Error";

//     case 503:
//       return "Service unavailable";

//     default:
//       return "Received invalid status code: $statusCode";
//   }
// }
