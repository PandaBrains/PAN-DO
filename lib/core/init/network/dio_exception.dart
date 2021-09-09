import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled.";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API Server.";
        break;
      case DioErrorType.other:
        message = "Connection to API Servevr failed due to network connection.";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API Server.";
        break;
      case DioErrorType.response:
        message = _hanleError(
            dioError.response!.statusCode, dioError.response!.data); // TODO
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API Server.";
        break;
      default:
        message = "Something went wrong.";
        break;
    }
  }

  String _hanleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return "Bad Request";
      case 404:
        return "Not Found";
      case 500:
        return "Interval Server Error";
      default:
        return "Something went wrong.";
    }
  }

  @override
  String toString() => message;
}
