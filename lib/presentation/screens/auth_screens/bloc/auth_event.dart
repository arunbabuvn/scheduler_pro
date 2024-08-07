import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends AuthEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends AuthEvent {
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends AuthEvent {
  final String confirmPassword;

  const ConfirmPasswordChanged({required this.confirmPassword});

  @override
  List<Object> get props => [confirmPassword];
}

class NameChanged extends AuthEvent {
  final String name;
  const NameChanged({required this.name});

  @override
  List<Object> get props => [name];
}

class SigninSubmitted extends AuthEvent {}

class TogglePasswordVisibility extends AuthEvent {}

class SigninFailureAcknowledged extends AuthEvent {}

class SigninWithGoogle extends AuthEvent {}

class SignUpSubmited extends AuthEvent {}

class SignOut extends AuthEvent {}
