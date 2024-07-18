import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/common/entities/user_entity.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthInitial());

  void updateUser(UserEntity? user) {
    if (user == null) {
      emit(AuthInitial());
    } else {
      emit(AuthIsUserLoggedIn(user));
    }
  }
}
