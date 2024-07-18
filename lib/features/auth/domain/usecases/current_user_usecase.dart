import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/usecase/usecase_template.dart';
import 'package:music_app/core/common/entities/user_entity.dart';
import 'package:music_app/features/auth/domain/repository/auth_repository.dart';

class GetCurrentUserDataUsecase implements UseCase<UserEntity, NoParams> {
  final AuthRepository authRepository;
  GetCurrentUserDataUsecase(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await authRepository.getCurrentUserData();
  }
}
