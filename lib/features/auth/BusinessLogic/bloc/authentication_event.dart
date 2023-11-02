// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class signInEvent extends AuthenticationEvent {
  final String password;
  final String email;
  signInEvent({
    required this.password,
    required this.email,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class signUpEvent extends AuthenticationEvent {
  final String name;
  final String password;
  final String email;
  signUpEvent({
    required this.name,
    required this.password,
    required this.email,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
