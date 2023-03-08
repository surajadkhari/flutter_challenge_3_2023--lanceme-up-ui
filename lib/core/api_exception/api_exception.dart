import 'package:dio/dio.dart';

class DioException implements Exception {
  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request was cancelled";
        break;
      case DioErrorType.connectionTimeout:
        message = "Connection timeout";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioErrorType.badResponse:
        message = _handleError(
            dioError.response!.statusCode!, dioError.response!.data);
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String? message;

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error["message"] ??
            error["success"] ??
            error["email"] ??
            "Error";
      case 401:
        return error["message"];
      case 404:
        return error["message"] ?? "Not found";
      case 422:
        return error["message"] ?? error["error"] ?? "Error";
      case 500:
        return "Internal server error";
      default:
        return "Something went wrong";
    }
  }
}
