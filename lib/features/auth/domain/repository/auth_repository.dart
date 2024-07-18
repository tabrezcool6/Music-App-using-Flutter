import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/common/entities/user_entity.dart';

abstract class AuthRepository {
  // Future<Either<Failure, void>> getUserSession();

  /// abstract interface method for registering a user
  Future<Either<Failure, UserEntity>> registerUser({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> loginUser({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> getCurrentUserData();
}
