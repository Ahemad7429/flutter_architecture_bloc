import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import '../../../utils/helpers/folder_utils.dart';
import '../../../utils/utility_helper.dart';

part 'api_request.dart';
part 'api_helper.dart';
part 'api_response.dart';
part 'api_error.dart';

class APIService {
  final int _statusCodeNoInternet = 1;
  final int _statusCodeEmptyResponse = 2;

  Map<String, dynamic> headers = {};

  Future<MultipartFile> _getMultipartFile(File file) async {
    UtilityHelper.showLog('filePath', file.path);
    String key;
    String type = FolderUtils().getFileName(file.path);
    type = type.split('.')[1];
    if (type == 'pdf') {
      key = 'application';
    } else {
      key = 'image';
    }
    return MultipartFile.fromFile(file.path, contentType: MediaType(key, type));
  }

  Future<Response<Map<String, dynamic>>> _getResponse(
      {APIRequest request, FormData formData}) async {
    switch (request.methodType) {
      case MethodType.GET:
        return Dio().get(request.url,
            options: Options(headers: headers),
            queryParameters: request.queryParams);
        break;
      case MethodType.POST:
        return Dio().post(request.url,
            options: Options(headers: headers),
            data: formData ?? request.params,
            queryParameters: request.queryParams);
        break;
      case MethodType.PATCH:
        return Dio().patch(request.url,
            options: Options(headers: headers),
            data: formData ?? request.params,
            queryParameters: request.queryParams);
        break;
      case MethodType.PUT:
        return Dio().put(request.url,
            options: Options(headers: headers),
            data: formData ?? request.params,
            queryParameters: request.queryParams);
        break;
      case MethodType.DELETE:
        return Dio().delete(request.url,
            options: Options(headers: headers),
            data: formData ?? request.params,
            queryParameters: request.queryParams);
        break;
    }
    return null;
  }

  Future<APIResponse> _authorizeTheUser() {
    final request = APIRequest(
        methodType: MethodType.POST,
        url: 'Url pass here',
        params: <String, dynamic>{'token': '1234'});
    return callService(request);
  }

  Future<APIResponse> callService(APIRequest request) async {
    try {
      if (await UtilityHelper.checkInternet()) {
        FormData formData;
        if (request.file != null) {
          formData = FormData.fromMap(request.params);
          formData.files.add(MapEntry<String, MultipartFile>(
              'File', await _getMultipartFile(request.file)));
        }

        UtilityHelper.showLog('Request:', request.params.toString());
        final Response<Map<String, dynamic>> response =
            await _getResponse(request: request, formData: formData);
        UtilityHelper.showLog('Response: ', response.data.toString());

        if (response != null) {
          final int statusCode = response.statusCode;
          if (response.statusCode >= 200 && response.statusCode <= 299) {
            return APIResponse.construct(
                code: response.statusCode, data: response.data);
          }
          switch (statusCode) {
            case 401:
              return _authorizeTheUser();
              break;
            default:
              return APIResponse.construct(code: response.statusCode);
          }
        }
        return APIResponse.construct(code: _statusCodeEmptyResponse);
      } else {
        return APIResponse.construct(code: _statusCodeNoInternet);
      }
    } on DioError catch (e) {
      return (e.response != null)
          ? APIResponse.construct(data: e.response.data as Map<String, dynamic>)
          : APIResponse.construct(error: e);
    } catch (e) {
      return APIResponse.construct(code: _statusCodeEmptyResponse);
    }
  }
}
