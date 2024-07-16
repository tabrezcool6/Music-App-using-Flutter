import 'package:flutter/material.dart';
import 'package:music_app/configs/theme/app_pallete.dart';

class Styles {
  ///
  /// Linear Gradient Styling
  static const appGradientStyle = LinearGradient(
    colors: [
      AppPallete.gradient1,
      AppPallete.gradient2,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}


/*
 static LinearGradient appGradientStyle() {
    return const LinearGradient(
      colors: [
        AppPallete.gradient1,
        AppPallete.gradient2,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    );
  }
 */