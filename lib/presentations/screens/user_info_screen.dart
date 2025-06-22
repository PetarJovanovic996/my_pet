import 'package:flutter/material.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: MainAppBar(title: 'user info'));
  }
}
