import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();
}

class InitialState extends BaseState {
  @override
  List<Object> get props => null;
}

class LoadingState extends BaseState {
  @override
  List<Object> get props => null;
}

class SuccessState extends BaseState {
  const SuccessState({this.data});

  final dynamic data;

  @override
  List<Object> get props => <Object>[data];
}

class FailedState extends BaseState {
  const FailedState({this.msg});

  final String msg;

  @override
  List<Object> get props => <Object>[msg];
}
