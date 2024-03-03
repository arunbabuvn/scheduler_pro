part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class LoginWithEmailEvent extends AuthEvent {
  final String emailId;
  final String password;
  LoginWithEmailEvent({this.emailId = "test@gmail.com", this.password = "123"});

  @override
  List<Object?> get props => [];
}

class LoginWithGoogleEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LogoutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class ShowPasswordEvent extends AuthEvent {
  final bool showPassword;
  ShowPasswordEvent({required this.showPassword});
  @override
  List<Object?> get props => [showPassword];

  void add() {}
}
