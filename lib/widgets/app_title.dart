import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Florist',
      style: TextStyle(
        fontSize: 26,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Playwrite',
      ),
    );
  }
}
