import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scheduler_pro/data/repository/auth_repository.dart';
import 'package:scheduler_pro/presentation/screens/auth_screens/bloc/auth_event.dart';
import 'package:scheduler_pro/presentation/screens/auth_screens/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthBloc() : super(AuthState.initial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<NameChanged>(_onNameChanged);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<SigninSubmitted>(_onSigninSubmitted);
    on<SigninFailureAcknowledged>(_onLoginFailureAcknowledged);
    on<SigninWithGoogle>(_onSigninWithGoogle);
    on<SignUpSubmited>(_onSignUpSubmited);
    on<SignOut>(_onSignout);
  }

  void _onEmailChanged(EmailChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onNameChanged(NameChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onConfirmPasswordChanged(ConfirmPasswordChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _onTogglePasswordVisibility(TogglePasswordVisibility event, Emitter<AuthState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> _onSigninSubmitted(SigninSubmitted event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    String response = await AuthRepository().signIn(state.email, state.password);
    if (response == "singedIn") {
      emit(state.copyWith(isSubmitting: false, signedIn: true));
    } else {
      emit(state.copyWith(isSubmitting: false, isFailure: true, errorMessage: response));
    }
  }

  Future<void> _onSignUpSubmited(SignUpSubmited event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    String response = await AuthRepository().signUp(state.email, state.password, state.confirmPassword, state.name);

    if (response == "signedUp") {
      emit(state.copyWith(isSubmitting: false, signedIn: true));
    } else {
      emit(state.copyWith(isSubmitting: false, isFailure: true, errorMessage: response));
    }
  }

  void _onLoginFailureAcknowledged(SigninFailureAcknowledged event, Emitter<AuthState> emit) {
    emit(state.copyWith(isFailure: false));
  }

  void _onSigninWithGoogle(SigninWithGoogle event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    final String response = await AuthRepository().signInWithGoogle();
    if (response == "singedIn") {
      emit(state.copyWith(isSubmitting: false, signedIn: true));
    } else {
      emit(state.copyWith(isSubmitting: false, isFailure: true, errorMessage: response));
    }
  }

  Future<void> _onSignout(SignOut event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    await AuthRepository().signOut();
    emit(state.copyWith(signedIn: false, isSubmitting: false));
  }
}
