part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class SigninWithEmailEvent extends AuthEvent {
  final String emailId;
  final String password;
  SigninWithEmailEvent({required this.emailId, required this.password});

  @override
  List<Object?> get props => [];
}

class SignupWithEmailEvent extends AuthEvent {
  final String emailId;
  final String password;
  SignupWithEmailEvent({required this.emailId, required this.password});
  @override
  List<Object?> get props => [];
}

class SigninWithGoogleEvent extends AuthEvent {
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
}
