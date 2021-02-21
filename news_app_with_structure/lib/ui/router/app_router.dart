import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_structure/bloc/auth/auth_bloc.dart';
import 'package:news_app_with_structure/bloc/auth/bloc.dart';
import 'package:news_app_with_structure/bloc/login/bloc.dart';
import 'package:news_app_with_structure/ui/screens/home/home_screen.dart';
import 'package:news_app_with_structure/ui/screens/intro/intro_screen.dart';
import 'package:news_app_with_structure/ui/screens/splash/splash_screen.dart';
import 'package:news_app_with_structure/ui/widgets/app_indicator.dart';
import 'package:news_app_with_structure/utils/theme/app_theme.dart';

class AppRouterPath {
  static const homeScreen = '/';
}

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterPath.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocBuilder<AuthBloc, BaseState>(
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
              return SplashScreen();
            },
          ),
        );
        break;
      default:
        return null;
    }
  }
}
