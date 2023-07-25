part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthEventLogin extends AuthEvent {
  final String email;
  final String password;

  AuthEventLogin({required this.email, required this.password});
}

class AuthEventSubscribe extends AuthEvent {
  final UserEntity user;
  final String password;

  AuthEventSubscribe({
    required this.user,
    required this.password,
  });
}