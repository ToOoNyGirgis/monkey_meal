import 'package:dio/dio.dart';

abstract class Failure{
final String errMessage;

 const Failure(this.errMessage);
}

class ServerFailure extends Failure{
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioErrors(DioException dioException){

    switch(dioException.type){
      case DioExceptionType.connectionTimeout:
       return ServerFailure('Connection timeout with Api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with Api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with Api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Incorrect Certificate timeout with Api server');
      case DioExceptionType.badResponse:
      return ServerFailure.badResponse(dioException.response!.statusCode,dioException.response!.data);
      case DioExceptionType.cancel:
      return ServerFailure('Request to Api server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with Api server');
      case DioExceptionType.unknown:
        if(dioException.message!.contains('SocketException')){
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('UnExpected error, Please try again again.');
      }
  }

  factory ServerFailure.badResponse(int? statusCode , dynamic response){
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Oops There was an Error, Please try again');
    }


  }

}