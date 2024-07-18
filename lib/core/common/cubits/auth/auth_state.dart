part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthIsUserLoggedIn extends AuthState {
  final UserEntity userEntity;
  AuthIsUserLoggedIn(this.userEntity);
}
