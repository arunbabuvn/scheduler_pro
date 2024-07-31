import 'package:equatable/equatable.dart';

class SigninState extends Equatable {
  final String email;
  final String password;
  final bool isPasswordVisible;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String errorMessage;

  const SigninState({
    required this.email,
    required this.password,
    required this.isPasswordVisible,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
    required this.errorMessage,
  });

  factory SigninState.initial() {
    return const SigninState(
      email: '',
      password: '',
      isPasswordVisible: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      errorMessage: '',
    );
  }

  SigninState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [email, password, isPasswordVisible, isSubmitting, isSuccess, isFailure, errorMessage];
}
