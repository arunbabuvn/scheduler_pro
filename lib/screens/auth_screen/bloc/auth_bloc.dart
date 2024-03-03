import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scheduler_pro/models/user.dart';
import 'package:scheduler_pro/services/authentication.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthenticateInitialState()) {
    on<AuthEvent>((event, emit) {});

    on<LoginWithEmailEvent>(
      (event, emit) async {
        emit(AuthentiateLoadingState());
        try {
          final MyUser? user = await AuthService()
              .signInWithEmail(event.emailId, event.password);
          if (user != null) {
            emit(AuthenticatedState(user));
          } else {
            emit(UnauthenticatedState("Login Failed"));
          }
        } catch (e) {}
        emit(AuthenticateInitialState());
      },
    );
    on<LogoutEvent>(
      (event, emit) {
        emit(AuthentiateLoadingState());
        try {
          AuthService().signOut();
        } catch (e) {}
        emit(AuthentiateLoadingState());
      },
    );
    on<ShowPasswordEvent>(
      (event, emit) {
        emit(ShowPasswordState(showPassword: event.showPassword));
      },
    );
  }
}
