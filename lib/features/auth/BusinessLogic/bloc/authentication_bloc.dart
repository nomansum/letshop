import 'dart:async';

import 'package:letshop/features/auth/BusinessLogic/bloc/authentication_event.dart';
import 'package:letshop/features/auth/BusinessLogic/bloc/authentication_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letshop/features/auth/Data/Repository/auth_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;

  AuthenticationBloc({required this.authRepository})
      : super(AuthenticationInitial()) {
    on<signInEvent>(signInWithEmailAndPassword);
    on<signUpEvent>(signUpWithEmailAndPassword);
  }

  FutureOr<void> signUpWithEmailAndPassword(
      signUpEvent event, Emitter<AuthenticationState> emit) async {
    emit(SignUpLoading());

    try {
      await authRepository.signUpUser(
          email: event.email, password: event.password, name: event.name);

      emit(SignUpSuccessful(event.email, event.password));
    } catch (error) {
      emit(SignUpFailed(errorText: "Something Went Wrong"));
    }
  }

  FutureOr<void> signInWithEmailAndPassword(
      signInEvent event, Emitter<AuthenticationState> emit) {}
}
