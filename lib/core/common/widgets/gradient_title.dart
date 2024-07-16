import 'package:flutter/material.dart';
import 'package:music_app/configs/theme/app_pallete.dart';

class GradientTitle extends StatelessWidget {
  final String title;
  final double? titleSize;
  const GradientTitle({required this.title, this.titleSize = 50, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: titleSize,
        fontWeight: FontWeight.bold,
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: <Color>[
              AppPallete.gradient1,
              AppPallete.gradient2,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ).createShader(
            const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
          ),
      ),
    );
  }
}
