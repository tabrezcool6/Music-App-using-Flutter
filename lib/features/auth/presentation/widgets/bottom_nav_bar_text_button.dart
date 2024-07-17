import 'package:flutter/material.dart';
import 'package:music_app/configs/theme/app_pallete.dart';
import 'package:music_app/features/auth/presentation/pages/register_page.dart';

class BottomNavBarTextButton extends StatelessWidget {
  const BottomNavBarTextButton({required this.redirectFlag, super.key});

  final String redirectFlag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            redirectFlag == 'register'
                ? 'Do you have an account?'
                : 'Don\'t have an account?',
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          GestureDetector(
            onTap: () => redirectFlag == 'register'
                ? Navigator.pop(context)
                : Navigator.push(context, RegisterPage.route()),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                redirectFlag == 'register' ? 'Login' : 'Register',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppPallete.gradient2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*

  /// Register Page Funtion 
  Widget _emailField(BuildContext context) {
  Widget _siginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account? ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, RegisterPage.route()),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Register',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppPallete.gradient2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


  /// Login Page Funtion 
  // Widget _emailField(BuildContext context) {
  Widget _siginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account? ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppPallete.gradient2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 */