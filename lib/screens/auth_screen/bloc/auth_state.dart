part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {
  bool isLoading;
  AuthLoadingState(this.isLoading);
  @override
  List<Object> get props => [isLoading];
}

class AuthenticatedState extends AuthState {
  final MyUser user;
  AuthenticatedState(this.user);
  @override
  List<Object> get props => [];
}

class AuthErrorState extends AuthState {
  final String errorMessage;
  AuthErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class ShowPasswordState extends AuthState {
  bool showPassword;
  ShowPasswordState({required this.showPassword});
  @override
  List<Object> get props => [showPassword];
}
