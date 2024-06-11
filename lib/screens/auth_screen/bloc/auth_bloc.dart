import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scheduler_pro/models/user.dart';
import 'package:scheduler_pro/services/authentication.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) {});

    on<SigninWithEmailEvent>(
      (event, emit) async {
        emit(AuthLoadingState(true));
        try {
          MyUser? user = await AuthService().signInWithEmail(event.emailId, event.password);
          if (user != null) {
            await Future.delayed(const Duration(seconds: 4));
            emit(AuthenticatedState(user));
          }
          emit(AuthLoadingState(false));
        } on FirebaseAuthException catch (e) {
          // if (e.code == 'user-not-found') {
          //   print('No user found for that email.');
          //   emit(AuthenticateFailedState('No user found for that email.'));
          // } else if (e.code == 'wrong-password') {
          //   print('Wrong password provided for that user.');
          //   emit(
          //     AuthenticateFailedState('Wrong password provided for that user.'),
          //   );
          // }
          print(e);
        }
      },
    );

    on<SignupWithEmailEvent>(
      (event, emit) async {
        emit(AuthLoadingState(true));
        try {
          MyUser? user = await AuthService().signUpWithEmail(event.emailId, event.password);
          if (user != null) {
            emit(AuthenticatedState(user));
          }
          emit(AuthLoadingState(false));
        } on FirebaseAuthException catch (e) {
          print(e);
        }
      },
    );
    on<LogoutEvent>(
      (event, emit) {
        emit(AuthLoadingState(true));
        try {
          AuthService().signOut();
        } catch (e) {}
        emit(AuthLoadingState(false));
      },
    );
    on<ShowPasswordEvent>(
      (event, emit) {
        emit(ShowPasswordState(showPassword: event.showPassword));
      },
    );
  }
}
