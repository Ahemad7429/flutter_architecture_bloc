part of 'api_service.dart';

class APIResponse {
  APIResponse({this.error, this.data, this.hasError});

  ErrorModel error;
  dynamic data;
  bool hasError;

  factory APIResponse.construct(
      {dynamic error, Map<String, dynamic> data, int code}) {
    if (code != null && code >= 200 && code <= 299) {
      return APIResponse(data: data, hasError: false);
    } else if (code != null) {
      final errorData = ErrorHandler.instance.getErrorObj(statusCode: code);
      return APIResponse(error: errorData, hasError: true);
    } else if (error != null) {
      final errorData = ErrorHandler.instance.getErrorObj(error: error);
      return APIResponse(error: errorData, hasError: true);
    } else {
      final errorData = ErrorModel.fromMap(data);
      UtilityHelper.showLog(errorData.errorCode, errorData.errorMessage);
      return APIResponse(error: errorData, hasError: true);
    }
  }
}
