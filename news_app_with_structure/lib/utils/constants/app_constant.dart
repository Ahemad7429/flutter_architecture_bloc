import 'package:news_app_with_structure/data/services/flavor_config.dart';
import 'package:news_app_with_structure/generated/l10n.dart';

part 'assets.dart';
part 'api_path.dart';
part 'pref_keys.dart';
part 'strings.dart';
part 'web.dart';
part 'dimens.dart';

class AppConst {
  const AppConst._();

  static _Strings strings = _Strings();
  static _Assets assets = _Assets();
  static _Web web = _Web();
  static _PrefKeys prefKeys = _PrefKeys();
  static _APIPath apiPath = _APIPath();
  static _Dimens dimens = _Dimens();
}
