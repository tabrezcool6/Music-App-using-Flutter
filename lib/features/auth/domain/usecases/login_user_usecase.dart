import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/usecase/usecase_template.dart';
import 'package:music_app/core/common/entities/user_entity.dart';
import 'package:music_app/features/auth/domain/repository/auth_repository.dart';

class LoginUserUsecase implements UseCase<UserEntity, LoginUserParams> {
  final AuthRepository authRepository;
  LoginUserUsecase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginUserParams params) async {
    return await authRepository.loginUser(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginUserParams {
  final String email;
  final String password;

  LoginUserParams({
    required this.email,
    required this.password,
  });
}
