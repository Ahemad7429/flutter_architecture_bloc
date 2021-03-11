part of 'app_constant.dart';

class _Web {
  String baseUrl = 'https://5fd9fcd06cf2e7001737edec.mockapi.io/';
  String get loginUrl => '${baseUrl}api/login';
  String get generateAuthUrl => '${baseUrl}api/generateAuth';

  String keyCode = 'code';
  String keyModule = 'module';

  int statusCodeNoInternet =
      1; // This code is representing no internet connection
  int statusCode2 = 2; //
}
