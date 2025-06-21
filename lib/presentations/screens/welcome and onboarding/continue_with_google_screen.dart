import 'package:flutter/material.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';

//TODO: Implement this

class ContinueWithGoogleScreen extends StatelessWidget {
  const ContinueWithGoogleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(title: 'Use google to sign in', showSignOut: false),
    );
  }
}
