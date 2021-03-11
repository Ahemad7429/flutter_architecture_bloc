import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app_with_structure/generated/l10n.dart';
import 'package:news_app_with_structure/ui/router/app_router.dart';
import 'package:news_app_with_structure/utils/helpers/service_locator.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        Localization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Localization.delegate.supportedLocales,
      onGenerateRoute: locator<AppRouter>().onGenerateRoute,
    );
  }
}
