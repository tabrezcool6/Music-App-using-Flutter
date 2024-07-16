import 'package:flutter/material.dart';
import 'package:music_app/core/common/widgets/gradient_logo.dart';
import 'package:music_app/features/auth/presentation/pages/login_page.dart';
import 'package:music_app/core/common/pages/get_started_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushAndRemoveUntil(
        context,
        GetStartedPage.route(),
        // LoginPage.route(),
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: GradientLogo()));
  }
}
