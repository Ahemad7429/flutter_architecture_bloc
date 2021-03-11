import 'package:flutter/foundation.dart';
import 'package:news_app_with_structure/data/models/request_models/login_req_model.dart';
import 'package:news_app_with_structure/data/models/response_models/login_res_model.dart';
import 'package:news_app_with_structure/data/services/api/api_service.dart';
import 'package:news_app_with_structure/utils/constants/app_constant.dart';

import 'bloc.dart';

class LoginRepository extends BaseRepository {
  Future<String> login(
      {@required String email, @required String password}) async {
    final Map<String, dynamic> requestParam =
        LoginRequestModel(email: email, password: password).toMap();
    final apiRequest = APIRequest(
        params: requestParam,
        methodType: MethodType.POST,
        url: AppConst.apiPath.loginUrl);
    final response = await apiService.callService(apiRequest);
    if (!response.hasError) {
      return LoginResponseModel.fromMap(response.data as Map<String, dynamic>)
          .token;
    } else {
      throw APIException(response.error.errorMessage);
    }
  }
}
