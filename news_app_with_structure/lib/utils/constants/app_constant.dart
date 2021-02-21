import 'package:news_app_with_structure/generated/l10n.dart';

part 'assets.dart';
part 'api_path.dart';
part 'pref_keys.dart';
part 'strings.dart';
part 'web.dart';
part 'dimens.dart';

class AppConst {
  const AppConst._();

  static var strings = _Strings();
  static var assets = _Assets();
  static var web = _Web();
  static var prefKeys = _PrefKeys();
  static var apiPath = _APIPath();
  static var dimens = _Dimens();
}
