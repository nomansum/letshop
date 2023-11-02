import "package:equatable/equatable.dart";

sealed class AuthenticationState {
  const AuthenticationState();
}

final class AuthenticationInitial extends AuthenticationState {}

final class LoginLoading extends AuthenticationState {}

final class LoginFailure extends AuthenticationState {}

final class SignUpLoading extends AuthenticationState {}

final class SignUpFailed extends AuthenticationState {
  final String errorText;

  SignUpFailed({required this.errorText});
}

final class SignUpSuccessful extends AuthenticationState {
  final String email;
  final String password;

  SignUpSuccessful(this.email, this.password);
}
