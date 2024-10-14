import 'package:flutter_challange/services/networking_engine_impl.dart';

class AppException implements Exception {
  final Object exception;

  AppException(this.exception);

  String getMessage() {
    return (exception is AppHttpException)
        ? (exception as AppHttpException).message
        : "Something goes wrong.";
  }
}
