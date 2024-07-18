import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/common/entities/user_entity.dart';
import 'package:music_app/core/common/utils.dart';
import 'package:music_app/core/common/widgets/appbar.dart';
import 'package:music_app/core/common/widgets/circular_loader.dart';
import 'package:music_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:music_app/features/auth/presentation/pages/login_page.dart';

class Homepage extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const Homepage());
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        hideBack: true,
        leading: IconButton(
          icon: const Icon(Icons.logout_outlined),
          onPressed: () {
            context.read<AuthBloc>().add(AuthLogOutUserEvent());
          },
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLogoutSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              LoginPage.route(),
              (route) => false,
            );
          }
          final user = context.read<AuthBloc>();

          print('////////// USERRR $user');
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const CircularLoader();
          }

          return const Center(
            child: Text('Music Page'),
          );
        },
      ),
    );
  }
}
