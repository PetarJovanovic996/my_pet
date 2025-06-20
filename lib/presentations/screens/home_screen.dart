import 'package:flutter/material.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: MainAppBar(title: 'Home Screen'));
  }
}
