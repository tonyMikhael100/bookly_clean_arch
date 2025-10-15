import 'package:dio/dio.dart';

class Failure {
  final String error;
  Failure({required this.error});
}

class ServerFailure extends Failure {
  ServerFailure({
    required super.error,
  });
  factory ServerFailure.handleError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(error: "Connection timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(error: "Send timeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(error: "Receive timeout");
      case DioExceptionType.badResponse:
        return handleResponse(dioException);
      case DioExceptionType.cancel:
        return ServerFailure(error: "Request cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure(error: "Connection error");
      case DioExceptionType.badCertificate:
        return ServerFailure(error: "Bad certificate");
      case DioExceptionType.unknown:
        return ServerFailure(error: "Unknown error");
    }
  }

  static ServerFailure handleResponse(DioException dioException) {
    final statusCode = dioException.response?.statusCode;
    switch (statusCode) {
      case 400:
        return ServerFailure(error: "Bad request");
      case 401:
        return ServerFailure(error: "email or password are incorrect ");
      case 403:
        return ServerFailure(error: "Forbidden");
      case 404:
        return ServerFailure(error: "Not found");
      case 500:
        return ServerFailure(error: "Internal server error");
      default:
        return ServerFailure(
            error: "Received invalid status code: $statusCode");
    }
  }
}
