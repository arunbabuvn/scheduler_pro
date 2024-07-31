import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scheduler_pro/presentation/screens/signin_screen/bloc/signin_event.dart';
import 'package:scheduler_pro/presentation/screens/signin_screen/bloc/signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final FirebaseAuth _firebaseAuth;
  SigninBloc({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth,
        super(SigninState.initial()) {
    on<SigninEmailChanged>(_onEmailChanged);
    on<SigninPasswordChanged>(_onPasswordChanged);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<SigninSubmitted>(_onSigninSubmitted);
    on<SigninFailureAcknowledged>(_onLoginFailureAcknowledged);
    on<SigninWithGoogle>(_onSigninWithGoogle);
  }

  void _onEmailChanged(SigninEmailChanged event, Emitter<SigninState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(SigninPasswordChanged event, Emitter<SigninState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onTogglePasswordVisibility(TogglePasswordVisibility event, Emitter<SigninState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> _onSigninSubmitted(SigninSubmitted event, Emitter<SigninState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } catch (e) {
      String errorMessage = "";
      if (e is FirebaseAuthException) {
        errorMessage = "Firebase Authentication error";
        if (e.code == "user-not-found") {
          errorMessage = "User not found";
        } else if (e.code == "wrong-password") {
          errorMessage = "wrong password";
        }
      } else {
        print('An unexpected error occurred: $e');
      }
      emit(state.copyWith(isSubmitting: false, isFailure: true, errorMessage: errorMessage));
    }
  }

  void _onLoginFailureAcknowledged(SigninFailureAcknowledged event, Emitter<SigninState> emit) {
    emit(state.copyWith(isFailure: false));
  }

  void _onSigninWithGoogle(SigninWithGoogle event, Emitter<SigninState> emit) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, isFailure: true, errorMessage: e.toString()));
    }
  }
}
