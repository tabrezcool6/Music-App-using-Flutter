import 'package:music_app/core/error/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> registerUser({
    required String name,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImplementation(this.supabaseClient);

  @override
  Future<String> registerUser({
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

      return response.user!.id.toString();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
