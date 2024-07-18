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

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => LoginPage());
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar:
            const BottomNavBarTextButton(redirectFlag: 'login'),
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
                        const GradientTitle(title: 'Login'),
                        const SizedBox(height: 50),
                        AuthTextField(
                            hint: 'Email', controller: _emailController),
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
                            text: 'Continue',
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                      AuthLoginUserEvent(
                                        email: _emailController.text.trim(),
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
      ),
    );
  }
}
