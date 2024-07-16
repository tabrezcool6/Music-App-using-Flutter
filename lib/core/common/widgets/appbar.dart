import 'package:flutter/material.dart';
import 'package:music_app/core/common/widgets/gradient_logo.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  final bool hideLogo;

  const CustomAppbar({
    this.title,
    this.hideBack = false,
    this.action,
    this.backgroundColor,
    this.hideLogo = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      title: !hideLogo
          ? const GradientLogo(shrinkSize: true)
          : title ?? const Text(''),
      actions: [action ?? Container()],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color:
                        // context.isDarkMode
                        //     ? Colors.white.withOpacity(0.03)  :
                        Colors.black.withOpacity(0.04),
                    shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color:
                      // context.isDarkMode ? Colors.white :
                      Colors.black,
                ),
              ),
            ),
      elevation: 0,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
