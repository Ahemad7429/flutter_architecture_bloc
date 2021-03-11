part of 'app_constant.dart';

class _APIPath {
  final String _baseUrl = AppFlavorConfig.instance.apiBaseUrl;
  String get loginUrl => '$_baseUrl/api/login';
  //String get generateAuthUrl => '${baseUrl}api/generateAuth';
}
