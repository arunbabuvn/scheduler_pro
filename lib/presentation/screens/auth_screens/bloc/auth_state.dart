import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthState extends Equatable {
  final String email;
  final String password;
  final String confirmPassword;
  final String name;
  final bool isPasswordVisible;
  final bool isSubmitting;
  final bool signedIn;
  final bool isFailure;
  final String errorMessage;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  AuthState({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.name,
    required this.isPasswordVisible,
    required this.isSubmitting,
    required this.signedIn,
    required this.isFailure,
    required this.errorMessage,
  });

  factory AuthState.initial() {
    return AuthState(
      email: '',
      password: '',
      confirmPassword: '',
      name: '',
      isPasswordVisible: false,
      isSubmitting: false,
      signedIn: false,
      isFailure: false,
      errorMessage: '',
    );
  }

  AuthState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
    bool? isPasswordVisible,
    bool? isSubmitting,
    bool? signedIn,
    bool? isFailure,
    String? errorMessage,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      name: name ?? this.name,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      signedIn: signedIn ?? this.signedIn,
      isFailure: isFailure ?? this.isFailure,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        confirmPassword,
        name,
        isPasswordVisible,
        isSubmitting,
        signedIn,
        isFailure,
        errorMessage,
      ];
}
