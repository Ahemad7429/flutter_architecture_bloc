import 'package:news_app_with_structure/bloc/base_repo.dart';
import 'package:news_app_with_structure/utils/constants/app_constant.dart';

class AuthRepository extends BaseRepository {
  Future<bool> hasToken() async {
    final value =
        await prefService.getStringPrefValue(key: AppConst.prefKeys.token);
    if (value.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await prefService.seStringPrefValue(
        value: token, key: AppConst.prefKeys.token);
  }

  Future<void> deleteToken() async {
    await prefService.clear();
  }
}
