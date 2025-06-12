import 'package:flutter/material.dart';

class WelcomeViewScreen extends StatelessWidget {
  const WelcomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/hello.jpg')),
    );
  }
}
