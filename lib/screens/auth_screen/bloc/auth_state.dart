part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthenticateInitialState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthentiateLoadingState extends AuthState {
  AuthentiateLoadingState();
  @override
  List<Object> get props => [];
}

class AuthenticatedState extends AuthState {
  final MyUser user;
  AuthenticatedState(this.user);
  @override
  List<Object> get props => [];
}

class UnauthenticatedState extends AuthState {
  final String errorMessage;
  UnauthenticatedState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class ShowPasswordState extends AuthState {
  bool showPassword;
  ShowPasswordState({required this.showPassword});
  @override
  List<Object> get props => [showPassword];
}
