import 'package:get_it/get_it.dart';
import 'package:news_app_with_structure/bloc/auth/bloc.dart';
import 'package:news_app_with_structure/bloc/login/login_bloc.dart';
import 'package:news_app_with_structure/bloc/login/login_repo.dart';
import 'package:news_app_with_structure/data/services/api_service.dart';
import 'package:news_app_with_structure/data/services/pref_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => APIService());
  locator.registerLazySingleton(() => PreferenceService());

  // Blocs
  locator.registerLazySingleton(
      () => LoginBloc(loginRepo: locator(), authBloc: locator()));
  locator.registerLazySingleton(() => AuthBloc(authRepository: locator()));

  // Repos
  locator.registerLazySingleton(() => BaseRepository());
  locator.registerLazySingleton(() => AuthRepository());
  locator.registerLazySingleton(() => LoginRepository());
}
