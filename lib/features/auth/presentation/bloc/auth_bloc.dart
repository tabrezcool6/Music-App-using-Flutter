import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/common/cubits/auth/auth_cubit.dart';
import 'package:music_app/core/usecase/usecase_template.dart';
import 'package:music_app/core/common/entities/user_entity.dart';
import 'package:music_app/features/auth/domain/usecases/current_user_usecase.dart';
import 'package:music_app/features/auth/domain/usecases/login_user_usecase.dart';
import 'package:music_app/features/auth/domain/usecases/logout_user_usecase.dart';
import 'package:music_app/features/auth/domain/usecases/register_user_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUserUsecase _registerUserUsecase;
  final LoginUserUsecase _loginUserUsecase;
  final GetCurrentUserDataUsecase _getCurrentUserDataUsecase;
  final LogoutUserUsecase _logoutUserUsecase;
  final AuthCubit _authCubit;

  AuthBloc({
    required RegisterUserUsecase registerUserUsecase,
    required LoginUserUsecase loginUserUsecase,
    required GetCurrentUserDataUsecase getCurrentUserDataUsecase,
    required LogoutUserUsecase logoutUserUsecase,
    required AuthCubit authCubit,
  })  : _registerUserUsecase = registerUserUsecase,
        _loginUserUsecase = loginUserUsecase,
        _getCurrentUserDataUsecase = getCurrentUserDataUsecase,
        _logoutUserUsecase = logoutUserUsecase,
        _authCubit = authCubit,
        super(
          AuthInitial(),
        ) {
    /// Auth Register Bloc Impl
    on<AuthRegisterUserEvent>(_onAuthRegisterUserEvent);

    on<AuthLoginUserEvent>(_onAuthLoginUserEvent);

    on<AuthGetCurrentUserDataEvent>(_onAuthGetCurrentUserDataEvent);

    on<AuthLogOutUserEvent>(_onAuthLogoutUserEvent);
  }

  void _onAuthRegisterUserEvent(
    AuthRegisterUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final response = await _registerUserUsecase.call(
      RegisterUserParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );

    response.fold(
      (error) => emit(AuthFailure(error.errorMessage)),
      (user) {
        _authCubit.updateUser(user);
        emit(AuthSuccess(user));
      },
    );
  }

  FutureOr<void> _onAuthLoginUserEvent(
    AuthLoginUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final response = await _loginUserUsecase.call(
      LoginUserParams(
        email: event.email,
        password: event.password,
      ),
    );

    response.fold(
      (error) => emit(AuthFailure(error.errorMessage)),
      (user) {
        _authCubit.updateUser(user);
        emit(AuthSuccess(user));
      },
    );
  }

  FutureOr<void> _onAuthGetCurrentUserDataEvent(
    AuthGetCurrentUserDataEvent event,
    Emitter<AuthState> emit,
  ) async {
    // emit(AuthLoading());
    final response = await _getCurrentUserDataUsecase.call(NoParams());
    response.fold(
      (error) => emit(AuthFailure(error.errorMessage)),
      (user) {
        _authCubit.updateUser(user);
        emit(AuthSuccess(user));
      },
    );
  }

  FutureOr<void> _onAuthLogoutUserEvent(
    AuthLogOutUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final response = await _logoutUserUsecase.call(NoParams());
    response.fold(
      (error) => emit(AuthFailure(error.errorMessage)),
      (user) {
        emit(AuthLogoutSuccess());
      },
    );
  }
}
