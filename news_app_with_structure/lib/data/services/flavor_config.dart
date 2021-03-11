import 'package:flutter/material.dart';

enum FlavorType {
  dev,
  prod,
  qa,
}

class AppFlavorConfig {
  final FlavorType flavorType;
  static AppFlavorConfig _current;

  factory AppFlavorConfig({@required FlavorType flavorType}) {
    return _current ??= AppFlavorConfig._internal(flavorType);
  }

  AppFlavorConfig._internal(this.flavorType);

  static AppFlavorConfig get instance {
    return _current;
  }

  String get appName {
    switch (flavorType) {
      case FlavorType.qa:
        return 'Demo App QA';
      case FlavorType.prod:
        return 'Demo App Production';
      default:
        return 'Demo App Development';
    }
  }

  String get apiBaseUrl {
    switch (flavorType) {
      case FlavorType.qa:
        return 'https://reqres.in';
      case FlavorType.prod:
        return 'https://reqres.in';
      default:
        return 'https://reqres.in';
    }
  }
}
