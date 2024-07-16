import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:music_app/core/common/cubits/theme_cubit.dart';
import 'package:path_provider/path_provider.dart';

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

    serviceLocator.registerLazySingleton(() => ThemeCubit());
  }
}
