import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/configs/theme/app_theme.dart';
import 'package:music_app/core/common/cubits/auth/auth_cubit.dart' as cubit;
import 'package:music_app/core/common/cubits/theme_cubit.dart';
import 'package:music_app/core/common/pages/splash_page.dart';
import 'package:music_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:music_app/features/music/homepage.dart';
import 'package:music_app/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await InitDependencies.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<ThemeCubit>()),
        BlocProvider(create: (_) => serviceLocator<cubit.AuthCubit>()),
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthGetCurrentUserDataEvent());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          title: 'Spotify using Clean Architecture and SOLID Principles',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          home: BlocSelector<cubit.AuthCubit, cubit.AuthState, bool>(
            selector: (state) {
              return state is cubit.AuthIsUserLoggedIn;
            },
            builder: (context, isLoggedIn) {
              if (isLoggedIn) {
                return const Homepage();
              }
              return const SplashPage();
            },
          ),
        );
      },
    );
  }
}
