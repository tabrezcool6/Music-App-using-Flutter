import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/auth/data/data_source/remote_data_source.dart';
import 'package:music_app/core/common/entities/user_entity.dart';
import 'package:music_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository {
  ///
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImplementation(this.authRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSource.registerUser(
        name: name,
        email: email,
        password: password,
      );

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSource.loginUser(
        email: email,
        password: password,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUserData() async {
    try {
      final response = await authRemoteDataSource.getCurrentUserData();

      if (response == null) {
        return left(Failure('User not logged in'));
      }

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> logoutUser() async {
    try {
      await authRemoteDataSource.logoutUser();
      return right('logout');
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  // @override
  // Future<Either<Failure, void>> getUserSession() async {
  //   try {
  //     final response = await authRemoteDataSource.getCurrentUserSession;
  //     return right(response);
  //   } on ServerException catch (e) {
  //     return left(Failure(e.message));
  //   }
  // }
}
