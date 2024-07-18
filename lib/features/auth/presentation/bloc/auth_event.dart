part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthRegisterUserEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  AuthRegisterUserEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

class AuthLoginUserEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginUserEvent({
    required this.email,
    required this.password,
  });
}

class AuthGetCurrentUserDataEvent extends AuthEvent {}

class AuthLogOutUserEvent extends AuthEvent {}
