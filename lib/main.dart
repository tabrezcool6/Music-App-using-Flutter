import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/configs/theme/app_theme.dart';
import 'package:music_app/core/common/cubits/theme_cubit.dart';
import 'package:music_app/core/common/pages/splash_page.dart';
import 'package:music_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:music_app/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await InitDependencies.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<ThemeCubit>()),
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Spotify using Clean Architecture and SOLID Principles',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}
