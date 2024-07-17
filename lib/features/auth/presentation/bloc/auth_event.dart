part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthRegisterUser extends AuthEvent {
  final String name;
  final String email;
  final String password;

  AuthRegisterUser({
    required this.name,
    required this.email,
    required this.password,
  });
}
