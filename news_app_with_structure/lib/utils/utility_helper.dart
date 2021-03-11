import 'dart:io';

import 'package:connectivity/connectivity.dart';

class UtilityHelper {
  static void showLog(String key, String value) {
    // ignore: avoid_print
    print('$key : $value');
  }

  static Future<bool> checkInternet() async {
    try {
      final ConnectivityResult connectivityResult =
          await Connectivity().checkConnectivity();
      final bool result = connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi;
      return result;
    } on SocketException catch (_) {
      return false;
    }
  }
}
