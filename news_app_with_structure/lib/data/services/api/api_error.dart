part of 'api_service.dart';

class APIConstError {
  static String kSomethingWentWrong = 'Something went wrong.';
  static String kNoInternetConnection = 'No internet connection.';
  static String kNoInternetConnection2 =
      'Connection to API server failed due to internet connection';
  static String kInternalServerError = 'Internal Server Error';
  static String kSendTimeOUT = 'Send timeout in connection with API server';
  static String kReceiveTimeOut =
      'Receive timeout in connection with API server';
  static String kTimeOut = 'Connection timeout with API server';
  static String kCancelled = 'Request to API server was cancelled';
  static String errorLoginFailed = 'Login Failed';

  static String kInvalidStatusCode({@required int statusCode}) =>
      'Received invalid status code: $statusCode';
}

class ErrorModel {
  final String errorCode;
  final String errorMessage;

  ErrorModel({
    this.errorCode,
    @required this.errorMessage,
  });

  factory ErrorModel.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    return ErrorModel(
      errorCode: data['code'] as String ?? '',
      errorMessage: data['error'] as String ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'error': errorMessage,
      'code': errorCode,
    };
  }
}

class ErrorHandler {
  static ErrorHandler instance = ErrorHandler();

  String _getDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        return APIConstError.kCancelled;
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        return APIConstError.kTimeOut;
        break;
      case DioErrorType.DEFAULT:
        return APIConstError.kNoInternetConnection2;
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        return APIConstError.kReceiveTimeOut;
        break;
      case DioErrorType.RESPONSE:
        return APIConstError.kInvalidStatusCode(
            statusCode: error.response.statusCode);
        break;
      case DioErrorType.SEND_TIMEOUT:
        return APIConstError.kSendTimeOUT;
        break;
      default:
        return APIConstError.kSomethingWentWrong;
        break;
    }
  }

  String _getErrorIfNullOrNotDioError(int code) {
    switch (code) {
      case 500:
        return APIConstError.kInternalServerError;
        break;
      case 1:
        return APIConstError.kNoInternetConnection;
        break;
      default:
        return APIConstError.kSomethingWentWrong;
        break;
    }
  }

  String getFinalError({dynamic error, int code}) {
    if (error != null) {
      if (error is DioError) {
        return _getDioError(error);
      } else {
        return _getErrorIfNullOrNotDioError(code);
      }
    }
    return _getErrorIfNullOrNotDioError(code);
  }

  ErrorModel getErrorObj({dynamic error, int statusCode}) {
    final String finalError = getFinalError(error: error, code: statusCode);
    UtilityHelper.showLog('$statusCode', finalError);
    return ErrorModel(errorCode: '$statusCode', errorMessage: finalError);
  }
}
