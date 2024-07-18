import 'package:music_app/configs/keys/keys.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/auth/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get getCurrentUserSession;

  Future<UserModel> registerUser({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> loginUser({
    required String email,
    required String password,
  });

  Future<UserModel?> getCurrentUserData();
}

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImplementation(this.supabaseClient);

  // implementing getCurrentUserSession
  @override
  Session? get getCurrentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );

      if (response.user == null) {
        throw ServerException(message: 'User is null');
      }

      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw ServerException(message: 'User is null');
      }

      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw ServerException(message: e.message);
    } on ServerException catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      if (getCurrentUserSession != null) {
        final response = await supabaseClient
            .from(Keys.SUPABASE_PROFILES_TABLES_KEY)
            .select()
            .eq('id', getCurrentUserSession!.user.id);

        return UserModel.fromJson(response.first);
      }

      return null;
    } on ServerException catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
