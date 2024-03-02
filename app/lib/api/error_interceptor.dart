import 'package:dio/dio.dart';

import '../helpers/helpers.dart';

class ErrorInterceptor extends Interceptor {
  final Dio dio;

  ErrorInterceptor({required this.dio});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        Toastr.showError(
            text: 'The connection has timed out, please try again.');
        break;
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            Toastr.showError(text: 'Invalid Request.');
            break;
          case 401:
            Toastr.showWarning(text: 'Unauthorized.');
            break;
          case 403:
            Toastr.showWarning(text: 'Access Denied.');
            break;
          case 404:
            Toastr.showError(
                text: 'The requested information could not be found');
            break;
          case 409:
            Toastr.showError(text: 'Conflict occurred.');
            break;
          case 500:
            Toastr.showError(
                text: 'Internal Server Error, please try again later.');
            break;
          default:
            Toastr.showError(text: 'Unable to Connect to Server..');
            break;
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        Toastr.showError(text: err.message ?? 'something went wrong');
    }

    return handler.next(err);
  }
}
