import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/failure.dart';

abstract class AuthRepository {
  /// abstract interface method for registering a user
  Future<Either<Failure, String>> registerUser({
    required String name,
    required String email,
    required String password,
  });
}
