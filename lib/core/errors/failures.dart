import 'package:dio/dio.dart';

abstract class Failure {
  final String errmessage;

  const Failure(this.errmessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errmessage);

  // ignore: deprecated_member_use
  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with API server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with API server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout  with API server');

      case DioExceptionType.badCertificate:
      // TODO: Handle this case.

      // TODO: Handle this case.
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was cancelled');
      // TODO: Handle this case.
      case DioExceptionType.connectionError:
      // TODO: Handle this case.
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error Occured');
      default:
        return ServerFailure('Unexpected Error Occured');
    }
  }
}
