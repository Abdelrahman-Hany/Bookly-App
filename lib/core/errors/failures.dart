import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Conection timeout with APIServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout with APIServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive timeout with APIServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad Certification with APIServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(
            errorMessage: 'Request to API Service was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'Connection Error');
      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage: 'Unexpected Error, Please try again!');
      default:
        return ServerFailure(
            errorMessage: 'Opps There was an Error, Please try again later!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errorMessage: 'Your request not found, Please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure(errorMessage: 'Server Error');
    } else {
      return ServerFailure(
          errorMessage: 'Opps There was an Error, Please try again later!');
    }
  }
}
