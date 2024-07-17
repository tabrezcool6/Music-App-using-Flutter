import 'package:get_it/get_it.dart';
import 'package:music_app/configs/keys/keys.dart';
import 'package:music_app/core/common/cubits/theme_cubit.dart';
import 'package:music_app/features/auth/data/data_source/remote_data_source.dart';
import 'package:music_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:music_app/features/auth/domain/repository/auth_repository.dart';
import 'package:music_app/features/auth/domain/usecases/register_user_usecase.dart';
import 'package:music_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

class InitDependencies {
  ///
  static Future<void> init() async {
    ///
    /// Hydrated Cubit initialization
    // HydratedBloc.storage = await HydratedStorage.build(
    //   storageDirectory: kIsWeb
    //       ? HydratedStorage.webStorageDirectory
    //       : await getApplicationDocumentsDirectory(),
    // );

    _initAuth();

    /// Supabase Project initialization
    final supabase = await Supabase.initialize(
      url: Keys.SUPABASE_URL,
      anonKey: Keys.SUPABASE_ANON_KEY,
    );

    ///
    serviceLocator.registerLazySingleton(() => supabase.client);

    /// Theme Cubit initialization
    serviceLocator.registerLazySingleton(() => ThemeCubit());  
  }

  static void _initAuth() {
    ///

    serviceLocator.registerFactory(
      () => AuthBloc(registerUserUsecase: serviceLocator()),
    );

    serviceLocator.registerFactory(
      () => RegisterUserUsecase(serviceLocator()),
    );

    serviceLocator.registerFactory<AuthRepository>(
      () => AuthRepositoryImplementation(serviceLocator()),
    );

    serviceLocator.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImplementation(serviceLocator()),
    );
  }
}
