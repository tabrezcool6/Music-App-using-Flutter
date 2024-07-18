part of 'auth_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthInitial extends AuthCubitState {}

final class AuthIsUserLoggedIn extends AuthCubitState {
  final UserEntity userEntity;
  AuthIsUserLoggedIn(this.userEntity);
}
