import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/usecase/usecase_template.dart';
import 'package:music_app/features/auth/domain/repository/auth_repository.dart';

class LogoutUserUsecase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;
  LogoutUserUsecase(this.authRepository);
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await authRepository.logoutUser();
  }
}
