part of 'api_service.dart';

class APIRequest {
  APIRequest({
    this.file,
    this.url,
    this.methodType,
    this.params,
    this.queryParams,
  });

  File file;
  String url;
  MethodType methodType;
  Map<String, dynamic> params;
  Map<String, dynamic> queryParams;
}
