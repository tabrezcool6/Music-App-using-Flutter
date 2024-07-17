import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.hint,
    required this.controller,
    this.obsecureText = false,
    this.obsecureOntap,
    super.key,
  });

  final String hint;
  final TextEditingController controller;
  final bool obsecureText;
  final VoidCallback? obsecureOntap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: hint == 'Password'
            ? IconButton(
                icon: Icon(
                  obsecureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: obsecureOntap,
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
}
