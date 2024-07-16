import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/core/common/pages/choose_theme_page.dart';
import 'package:music_app/configs/constants/app_images.dart';
import 'package:music_app/configs/theme/app_pallete.dart';
import 'package:music_app/core/common/widgets/gradient_button.dart';
import 'package:music_app/core/common/widgets/gradient_logo.dart';
import 'package:music_app/core/common/widgets/gradient_title.dart';

class GetStartedPage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const GetStartedPage(),
      );
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.introBG,
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
                  const Spacer(),
                  const GradientTitle(
                    title: 'Enjoy Listening Music',
                    titleSize: 36.0,
                  ),
                  const SizedBox(height: 14.0),
                  const Text(
                    'Lorem ipsum  amet venenatis urna cursus eget nunc scelerisque  mauris in aliquam sem fringilla  morbi tincidunt  interdum velit euismod  pellentesque massa placerat duis ultricies lacus sed turpis ',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: AppPallete.grey,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 18.0),
                  GradientButton(
                    text: 'Get Started',
                    onTap: () => Navigator.push(
                      // pushAndRemoveUntil
                      context,
                      ChooseThemePage.route(),
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
