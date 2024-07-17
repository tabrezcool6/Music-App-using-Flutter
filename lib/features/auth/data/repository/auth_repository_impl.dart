import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/auth/data/data_source/remote_data_source.dart';
import 'package:music_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository {
  ///
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImplementation(this.authRemoteDataSource);

  @override
  Future<Either<Failure, String>> registerUser({
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
      return left(Failure(e.toString()));
    }
  }
}
