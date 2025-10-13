import 'package:dio/dio.dart';

class Failure {
  final String error;
  Failure({required this.error});
}

class DioFailure extends Failure {
  DioFailure({required super.error});
  factory DioFailure.handleError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return DioFailure(error: "Connection timeout");
      case DioExceptionType.sendTimeout:
        return DioFailure(error: "Send timeout");
      case DioExceptionType.receiveTimeout:
        return DioFailure(error: "Receive timeout");
      case DioExceptionType.badResponse:
        return DioFailure(error: "Bad response");
      case DioExceptionType.cancel:
        return DioFailure(error: "Request cancelled");
      case DioExceptionType.connectionError:
        return DioFailure(error: "Connection error");
      case DioExceptionType.badCertificate:
        return DioFailure(error: "Bad certificate");
      case DioExceptionType.unknown:
        return DioFailure(error: "Unknown error");
    }
  }
}
