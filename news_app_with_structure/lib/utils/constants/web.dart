part of 'app_constant.dart';

class _Web {
  String baseUrl = 'https://5fd9fcd06cf2e7001737edec.mockapi.io/';
  String get loginUrl => baseUrl + 'api/login';
  String get generateAuthUrl => '${baseUrl}api/generateAuth';

  String get = 'GET';
  String post = 'POST';
  String keySuccess = 'success';
  String keyResult = 'result';
  String keyError = 'error';
  String keyCode = 'code';
  String keyMessage = 'message';
  String keyModule = 'module';
  String keyFile = 'File';
  int statusCodeNoInternet =
      1; // This code is representing no internet connection
  int statusCode2 = 2; //
}
