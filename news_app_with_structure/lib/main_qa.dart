import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_structure/bloc/auth/bloc.dart';
import 'package:news_app_with_structure/main.dart';
import 'package:news_app_with_structure/data/services/flavor_config.dart';
import 'package:news_app_with_structure/utils/helpers/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  AppFlavorConfig(flavorType: FlavorType.qa);
  runApp(
    BlocProvider<AuthBloc>(
      create: (context) {
        return locator.get<AuthBloc>()..add(AppStarted());
      },
      child: MyApp(),
    ),
  );
}
