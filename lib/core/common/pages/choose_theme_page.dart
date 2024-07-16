import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/configs/constants/app_images.dart';
import 'package:music_app/configs/constants/app_vectors.dart';
import 'package:music_app/configs/theme/app_pallete.dart';
import 'package:music_app/core/common/cubits/theme_cubit.dart';
import 'package:music_app/core/common/styles.dart';
import 'package:music_app/core/common/widgets/gradient_button.dart';
import 'package:music_app/core/common/widgets/gradient_logo.dart';
import 'package:music_app/core/common/widgets/gradient_title.dart';
import 'package:music_app/features/auth/presentation/pages/login_page.dart';

class ChooseThemePage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ChooseThemePage());
  const ChooseThemePage({super.key});

  @override
  State<ChooseThemePage> createState() => _ChooseThemePageState();
}

class _ChooseThemePageState extends State<ChooseThemePage> {
  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = context.read<ThemeCubit>().state;

    bool isDarkTheme = themeMode == ThemeMode.dark ? true : false;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.chooseModeBG,
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            color: AppPallete.blackOverlay,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 80.0, horizontal: 32.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: GradientLogo(),
                  ),
                  const Spacer(flex: 3),
                  const GradientTitle(title: 'Choose Mode', titleSize: 36.0),
                  const SizedBox(height: 28.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /// Select Light Theme Button
                      SelectThemeButton(
                        btnTitle: 'Light Mode',
                        isDarkTheme: isDarkTheme,
                        onTap: () {
                          context
                              .read<ThemeCubit>()
                              .chooseTheme(ThemeMode.light);

                          isDarkTheme = false;
                          setState(() {});
                        },
                      ),

                      /// Select Dark Theme Button
                      SelectThemeButton(
                        btnTitle: 'Dark Mode',
                        isDarkTheme: isDarkTheme,
                        onTap: () {
                          context
                              .read<ThemeCubit>()
                              .chooseTheme(ThemeMode.dark);

                          isDarkTheme = true;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 48.0),
                  GradientButton(
                    text: 'Continue',
                    onTap: () => Navigator.push(
                      // pushAndRemoveUntil
                      context,
                      LoginPage.route(),
                      // (route) => false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Select theme Widget
class SelectThemeButton extends StatelessWidget {
  final String btnTitle;
  final bool isDarkTheme;
  final VoidCallback onTap;
  const SelectThemeButton({
    super.key,
    required this.btnTitle,
    required this.isDarkTheme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: btnTitle == 'Light Mode'
                      ? isDarkTheme
                          ? AppPallete.themeModeCircle
                          : null
                      : isDarkTheme
                          ? null
                          : AppPallete.themeModeCircle,
                  gradient: btnTitle == 'Light Mode'
                      ? isDarkTheme
                          ? null
                          : Styles.appGradientStyle
                      : isDarkTheme
                          ? Styles.appGradientStyle
                          : null,
                ),
                child: SvgPicture.asset(
                  btnTitle == 'Light Mode' ? AppVectors.sun : AppVectors.moon,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14.0),
          Text(
            btnTitle,
            // 'Light Mode',
            style: const TextStyle(
              fontSize: 18.0,
              color: AppPallete.grey,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/*

// TODO: Back Up code


                      // GestureDetector(
                      //   onTap: () {
                      //     context
                      //         .read<ThemeCubit>()
                      //         .chooseTheme(ThemeMode.light);

                      //     isDarkTheme = false;
                      //     setState(() {});
                      //   },
                      //   child: Column(
                      //     children: [
                      //       ClipOval(
                      //         child: BackdropFilter(
                      //           filter: ImageFilter.blur(
                      //               sigmaX: 10.0, sigmaY: 10.0),
                      //           child: Container(
                      //             height: 80,
                      //             width: 80,
                      //             decoration: BoxDecoration(
                      //               shape: BoxShape.circle,
                      //               color: isDarkTheme
                      //                   ? AppPallete.themeModeCircle
                      //                   : null,
                      //               gradient: isDarkTheme
                      //                   ? null
                      //                   : Styles.appGradientStyle,
                      //             ),
                      //             child: SvgPicture.asset(
                      //               AppVectors.sun,
                      //               fit: BoxFit.none,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       const SizedBox(height: 14.0),
                      //       const Text(
                      //         'Light Mode',
                      //         style: TextStyle(
                      //           fontSize: 18.0,
                      //           color: AppPallete.grey,
                      //           fontWeight: FontWeight.w500,
                      //         ),
                      //         textAlign: TextAlign.center,
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      /// Select Dark Theme Button
                      // GestureDetector(
                      //   onTap: () {
                      //     context
                      //         .read<ThemeCubit>()
                      //         .chooseTheme(ThemeMode.dark);
                      //     isDarkTheme = true;
                      //     setState(() {});
                      //   },
                      //   child: Column(
                      //     children: [
                      //       ClipOval(
                      //         child: BackdropFilter(
                      //           filter: ImageFilter.blur(
                      //               sigmaX: 10.0, sigmaY: 10.0),
                      //           child: Container(
                      //             height: 80,
                      //             width: 80,
                      //             decoration: BoxDecoration(
                      //               shape: BoxShape.circle,
                      //               color: isDarkTheme
                      //                   ? null
                      //                   : AppPallete.themeModeCircle,
                      //               gradient: isDarkTheme
                      //                   ? Styles.appGradientStyle
                      //                   : null,
                      //             ),
                      //             child: SvgPicture.asset(
                      //               AppVectors.moon,
                      //               fit: BoxFit.none,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       const SizedBox(height: 14.0),
                      //       const Text(
                      //         'Dark Mode',
                      //         style: TextStyle(
                      //           fontSize: 18.0,
                      //           color: AppPallete.grey,
                      //           fontWeight: FontWeight.w500,
                      //         ),
                      //         textAlign: TextAlign.center,
                      //       ),
                      //     ],
                      //   ),
                      // ),

 */
