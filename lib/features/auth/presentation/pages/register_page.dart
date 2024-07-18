import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/common/utils.dart';
import 'package:music_app/core/common/widgets/appbar.dart';
import 'package:music_app/core/common/widgets/circular_loader.dart';
import 'package:music_app/core/common/widgets/gradient_button.dart';
import 'package:music_app/core/common/widgets/gradient_title.dart';
import 'package:music_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:music_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:music_app/features/auth/presentation/widgets/bottom_nav_bar_text_button.dart';
import 'package:music_app/features/music/homepage.dart';

class RegisterPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      );

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar:
          const BottomNavBarTextButton(redirectFlag: 'register'),
      appBar: const CustomAppbar(hideBack: true),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            Utils.showSnackBar(context, state.message);
          }
          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              Homepage.route(),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const CircularLoader();
          }
          return Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///
                      const GradientTitle(title: 'Register'),

                      const SizedBox(height: 50),

                      AuthTextField(hint: 'Name', controller: _nameController),

                      const SizedBox(height: 28),

                      AuthTextField(
                          hint: 'E-mail', controller: _emailController),

                      const SizedBox(height: 28),

                      AuthTextField(
                        hint: 'Password',
                        controller: _passwordController,
                        obsecureText: obsecureText,
                        obsecureOntap: () => setState(() {
                          obsecureText = !obsecureText;
                        }),
                      ),

                      const SizedBox(height: 50),

                      GradientButton(
                          text: 'Create Account',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    AuthRegisterUserEvent(
                                      name: _nameController.text.toString(),
                                      email: _emailController.text.toString(),
                                      password:
                                          _passwordController.text.toString(),
                                    ),
                                  );
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*

  TextFormField _inputField({
    required BuildContext context,
    required String hint,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: hint == 'Password'
            ? IconButton(
                icon: Icon(
                  obsecureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () => setState(() {
                  obsecureText = !obsecureText;
                }),
              )
            : null,
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
      obscureText: obsecureText,
      validator: (value) {
        if (value!.isEmpty) {
          return '$hint cannot be empty';
        }
        return null;
      },
    );
  }

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



 */