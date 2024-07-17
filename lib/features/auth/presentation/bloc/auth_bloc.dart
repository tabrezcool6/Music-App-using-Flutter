import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/auth/domain/usecases/register_user_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUserUsecase _registerUserUsecase;

  AuthBloc({
    required RegisterUserUsecase registerUserUsecase,
  })  : _registerUserUsecase = registerUserUsecase,
        super(
          AuthInitial(),
        ) {
    /// Auth Register Bloc Impl
    on<AuthRegisterUser>(
      (event, emit) async {
        final response = await _registerUserUsecase.call(RegisterUserParams(
          name: event.name,
          email: event.email,
          password: event.password,
        ));

        response.fold(
          (l) => emit(AuthFailure(l.errorMessage)),
          (r) => emit(AuthSuccess(r)),
        );
      },
    );
  }
}
