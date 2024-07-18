import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const Homepage());
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Music Page'),
      ),
    );
  }
}
