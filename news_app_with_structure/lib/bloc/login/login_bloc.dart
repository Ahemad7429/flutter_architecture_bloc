import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app_with_structure/bloc/auth/bloc.dart';
import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, BaseState> {
  final LoginRepository loginRepo;
  final AuthBloc authBloc;

  LoginBloc({
    @required this.loginRepo,
    @required this.authBloc,
  })  : assert(loginRepo != null),
        assert(authBloc != null),
        super(InitialState());

  @override
  Stream<BaseState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoadingState();
      try {
        final token = await loginRepo.login(
          email: event.email,
          password: event.password,
        );
        authBloc.add(LoggedIn(token: token));
        yield InitialState();
      } catch (error) {
        yield FailedState(msg: error.toString());
      }
    }
  }
}
