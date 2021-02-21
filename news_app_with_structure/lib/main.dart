import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app_with_structure/bloc/auth/bloc.dart';
import 'package:news_app_with_structure/generated/l10n.dart';
import 'package:news_app_with_structure/ui/screens/home/home_screen.dart';
import 'package:news_app_with_structure/ui/screens/intro/intro_screen.dart';
import 'package:news_app_with_structure/ui/widgets/app_indicator.dart';
import 'package:news_app_with_structure/utils/helpers/service_locator.dart';
import 'package:news_app_with_structure/utils/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    BlocProvider<AuthBloc>(
      create: (context) {
        return locator.get<AuthBloc>()..add(AppStarted());
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        Localization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Localization.delegate.supportedLocales,
      home: BlocBuilder<AuthBloc, BaseState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return HomeScreen();
          }
          if (state is AuthenticationUnauthenticated) {
            return IntroScreen();
          }
          if (state is LoadingState) {
            return Scaffold(
              body: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 25.0,
                      width: 25.0,
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            AppTheme.color.mainColor),
                        strokeWidth: 4.0,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: AppIndicator(),
          );
        },
      ),
    );
  }
}
