import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/configs/constants/app_vectors.dart';
import 'package:music_app/configs/theme/app_pallete.dart';

class GradientLogo extends StatelessWidget {
  final bool shrinkSize;
  const GradientLogo({
    this.shrinkSize = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            AppPallete.gradient1,
            AppPallete.gradient2,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ).createShader(bounds);
      },
      child: SvgPicture.asset(
        AppVectors.logo,
        width: shrinkSize ? 40 : null,
        height: shrinkSize ? 40 : null,
      ),
    );
  }
}
