import 'package:flutter/material.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';

class ContinueWithFacebookScreen extends StatelessWidget {
  const ContinueWithFacebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(title: 'Use facebook to sign in', showSignOut: false),
    );
  }
}
