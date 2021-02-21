import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, BaseState> {
  final AuthRepository authRepository;

  AuthBloc({@required this.authRepository}) : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* mapAppStartedEventToState(event);
    } else if (event is LoggedIn) {
      yield* mapLogInEventToState(event);
    } else if (event is LoggedOut) {
      yield* mapLoggedOutEventToState(event);
    }
  }

  Stream<BaseState> mapLogInEventToState(
    LoggedIn event,
  ) async* {
    yield LoadingState();
    await authRepository.persistToken(event.token);
    yield AuthenticationAuthenticated();
  }

  Stream<BaseState> mapLoggedOutEventToState(
    LoggedOut event,
  ) async* {
    yield LoadingState();
    await authRepository.deleteToken();
    yield AuthenticationUnauthenticated();
  }

  Stream<BaseState> mapAppStartedEventToState(
    AppStarted event,
  ) async* {
    final bool hasToken = await authRepository.hasToken();
    if (hasToken) {
      yield AuthenticationAuthenticated();
    } else {
      yield AuthenticationUnauthenticated();
    }
  }
}
