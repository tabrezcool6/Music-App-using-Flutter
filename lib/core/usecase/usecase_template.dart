import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/failure.dart';

/// Usecase interface class
abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
