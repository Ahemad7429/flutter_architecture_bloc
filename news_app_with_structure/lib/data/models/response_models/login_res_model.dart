import 'package:flutter/foundation.dart';

class LoginResponseModel {
  final String token;

  LoginResponseModel({@required this.token});

  factory LoginResponseModel.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    return LoginResponseModel(
      token: data['token'],
    );
  }
}
