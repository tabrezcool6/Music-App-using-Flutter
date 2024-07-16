import 'package:flutter/material.dart';
import 'package:music_app/configs/theme/app_pallete.dart';
import 'package:music_app/core/common/widgets/appbar.dart';
import 'package:music_app/core/common/widgets/gradient_button.dart';
import 'package:music_app/core/common/widgets/gradient_title.dart';
import 'package:music_app/features/auth/presentation/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => LoginPage());
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _siginText(context),
      appBar: const CustomAppbar(hideBack: true),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const GradientTitle(title: 'Login'),

                // _registerText(),

                const SizedBox(height: 50),

                _inputField(context, 'Email', _emailController),

                const SizedBox(height: 28),

                _inputField(context, 'Password', _passwordController),

                const SizedBox(height: 50),

                GradientButton(text: 'Continue', onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _registerText() {
  //   return const Text(
  //     'Continue',
  //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
  //     textAlign: TextAlign.center,
  //   );
  // }

  Widget _inputField(
    BuildContext context,
    String hint,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: hint).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  // Widget _emailField(BuildContext context) {
  //   return TextField(
  //     controller: _emailController,
  //     decoration: const InputDecoration(hintText: 'Enter Email')
  //         .applyDefaults(Theme.of(context).inputDecorationTheme),
  //   );
  // }

  // Widget _passwordField(BuildContext context) {
  //   return TextField(
  //     controller: _passwordController,
  //     decoration: const InputDecoration(hintText: 'Password')
  //         .applyDefaults(Theme.of(context).inputDecorationTheme),
  //   );
  // }

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
