import 'package:news_app_with_structure/data/services/api/api_service.dart';
import 'package:news_app_with_structure/data/services/pref_service.dart';
import 'package:news_app_with_structure/utils/helpers/service_locator.dart';

class BaseRepository {
  final apiService = locator<APIService>();
  final prefService = locator<PreferenceService>();
}
