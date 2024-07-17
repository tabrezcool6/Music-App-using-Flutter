import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/usecase/usecase_template.dart';
import 'package:music_app/features/auth/domain/repository/auth_repository.dart';

class RegisterUserUsecase implements UseCase<String, RegisterUserParams> {
  final AuthRepository authRepository;
  RegisterUserUsecase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(RegisterUserParams params) async {
    return await authRepository.registerUser(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class RegisterUserParams {
  final String name;
  final String email;
  final String password;

  RegisterUserParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
