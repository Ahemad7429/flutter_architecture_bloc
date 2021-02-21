import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app_with_structure/data/models/request_models/login_req_model.dart';
import 'package:news_app_with_structure/data/models/response_models/login_res_model.dart';
import 'package:news_app_with_structure/utils/constants/app_constant.dart';

import 'bloc.dart';

class LoginRepository extends BaseRepository {
  final Dio _dio = Dio();

  Future<String> login(
      {@required String email, @required String password}) async {
    var requestParam =
        LoginRequestModel(email: email, password: password).toMap();
    Response response =
        await _dio.post(AppConst.apiPath.loginUrl, data: requestParam);
    return LoginResponseModel.fromMap(response.data).token;
  }
}
