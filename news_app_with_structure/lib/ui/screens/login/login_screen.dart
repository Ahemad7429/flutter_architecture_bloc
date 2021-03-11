import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_structure/bloc/login/login_bloc.dart';
import 'package:news_app_with_structure/ui/screens/login/login_widgets/login_form.dart';
import 'package:news_app_with_structure/utils/helpers/service_locator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return locator.get<LoginBloc>();
        },
        child: const LoginForm(),
      ),
    );
  }
}
