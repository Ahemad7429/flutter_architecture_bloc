// ignore_for_file: constant_identifier_names

part of 'api_service.dart';

enum MethodType {
  GET,
  POST,
  PATCH,
  PUT,
  DELETE,
}

class APIException implements Exception {
  final String _message;

  APIException(this._message);

  @override
  String toString() {
    return _message;
  }
}
